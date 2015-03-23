<?php

namespace alojaweb\Controller;

use alojaweb\inc\HighCharts;
use alojaweb\inc\Utils;
use alojaweb\inc\DBUtils;
use alojaweb\inc\MLUtils;

class MLTemplatesController extends AbstractController
{
	public function mlpredictionAction()
	{
		$jsonExecs = array();
		$instance = $error_stats = '';
		try
		{
			$dbml = new \PDO($this->container->get('config')['db_conn_chain_ml'], $this->container->get('config')['mysql_user'], $this->container->get('config')['mysql_pwd']);
		        $dbml->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
		        $dbml->setAttribute(\PDO::ATTR_EMULATE_PREPARES, false);

		    	$db = $this->container->getDBUtils();
		    	
		    	$configurations = array ();	// Useless here
		    	$where_configs = '';
		    	$concat_config = "";		// Useless here
		    	
			$params = array();
			$param_names = array('benchs','nets','disks','mapss','iosfs','replications','iofilebufs','comps','blk_sizes','id_clusters'); // Order is important
			foreach ($param_names as $p) { $params[$p] = Utils::read_params($p,$where_configs,$configurations,$concat_config); sort($params[$p]); }

			$learn_param = (array_key_exists('learn',$_GET))?$_GET['learn']:'regtree';
			$unrestricted = (array_key_exists('umodel',$_GET) && $_GET['umodel'] == 1);

			if (count($_GET) <= 1)
 			{
				$where_configs = '';
				$params['disks'] = array('HDD','SSD'); $where_configs .= ' AND disk IN ("HDD","SSD")';
				$params['iofilebufs'] = array('32768','65536','131072'); $where_configs .= ' AND iofilebuf IN ("32768","65536","131072")';
				$params['comps'] = array('0'); $where_configs .= ' AND comp IN ("0")';
				$params['replications'] = array('1'); $where_configs .= ' AND replication IN ("1")';
				$unrestricted = TRUE;			
 			}

			// compose instance
			$instance = MLUtils::generateSimpleInstance($param_names, $params, $unrestricted,$db);
			$model_info = MLUtils::generateModelInfo($param_names, $params, $unrestricted,$db);

			$config = $model_info.' '.$learn_param;
			$learn_options = 'saveall='.md5($config);

			if ($learn_param == 'regtree') { $learn_method = 'aloja_regtree'; $learn_options .= ':prange=0,20000'; }
			else if ($learn_param == 'nneighbours') { $learn_method = 'aloja_nneighbors'; $learn_options .=':kparam=3';}
			else if ($learn_param == 'nnet') { $learn_method = 'aloja_nnet'; $learn_options .= ':prange=0,20000'; }
			else if ($learn_param == 'polyreg') { $learn_method = 'aloja_linreg'; $learn_options .= ':ppoly=3:prange=0,20000'; }

			$cache_ds = getcwd().'/cache/query/'.md5($config).'-cache.csv';

			$is_cached_mysql = $dbml->query("SELECT id_learner FROM learners WHERE id_learner = '".md5($config)."'");
			$is_cached = ($is_cached_mysql->fetchColumn() == 0);

			$in_process = file_exists(getcwd().'/cache/query/'.md5($config).'.lock');

			if (!$is_cached && !$in_process)
			{
				// get headers for csv
				$header_names = array(
					'id_exec' => 'ID','bench' => 'Benchmark','exe_time' => 'Exe.Time','net' => 'Net','disk' => 'Disk','maps' => 'Maps','iosf' => 'IO.SFac',
					'replication' => 'Rep','iofilebuf' => 'IO.FBuf','comp' => 'Comp','blk_size' => 'Blk.size','e.id_cluster' => 'Cluster','name' => 'Cl.Name',
					'datanodes' => 'Datanodes','headnodes' => 'Headnodes','vm_OS' => 'VM.OS','vm_cores' => 'VM.Cores','vm_RAM' => 'VM.RAM',
					'provider' => 'Provider','vm_size' => 'VM.Size','type' => 'Type'
				);
				$headers = array_keys($header_names);
				$names = array_values($header_names);

			    	// dump the result to csv
			    	$query = "SELECT ".implode(",",$headers)." FROM execs e LEFT JOIN clusters c ON e.id_cluster = c.id_cluster WHERE e.valid = TRUE AND e.exe_time > 100".$where_configs.";";
			    	$rows = $db->get_rows ( $query );
				if (empty($rows)) throw new \Exception('No data matches with your critteria.');

				$fp = fopen($cache_ds, 'w');
				fputcsv($fp, $names,',','"');
			    	foreach($rows as $row)
				{
					$row['id_cluster'] = "Cl".$row['id_cluster'];	// Cluster is numerically codified...
					$row['comp'] = "Cmp".$row['comp'];		// Compression is numerically codified...
					fputcsv($fp, array_values($row),',','"');
				}

				// run the R processor
				exec('cd '.getcwd().'/cache/query ; touch '.getcwd().'/cache/query/'.md5($config).'.lock');
				exec('cd '.getcwd().'/cache/query ; '.getcwd().'/resources/queue -c "'.getcwd().'/resources/aloja_cli.r -d '.$cache_ds.' -m '.$learn_method.' -p '.$learn_options.' > /dev/null 2>&1; rm -f '.getcwd().'/cache/query/'.md5($config).'.lock" > /dev/null 2>&1 -p 1 &');
			}

			$in_process = file_exists(getcwd().'/cache/query/'.md5($config).'.lock');

			if ($in_process)
			{
				$jsonExecs = "[]";
				$must_wait = "YES";
				$max_x = $max_y = 0;
			}
			else
			{
				$is_cached_mysql = $dbml->query("SELECT id_learner FROM learners WHERE id_learner = '".md5($config)."'");
				if ($is_cached_mysql->fetchColumn() == 0) 
				{
					// register model to DB
					$query = "INSERT INTO learners (id_learner,instance,model,algorithm)";
					$query = $query." VALUES ('".md5($config)."','".$instance."','".substr($model_info,1)."','".$learn_param."');";
					if ($dbml->query($query) === FALSE) throw new \Exception('Error when saving model into DB');

					// read results of the CSV and dump to DB
					foreach (array("tt", "tv", "tr") as $value)
					{
						if (($handle = fopen(getcwd().'/cache/query/'.md5($config).'-'.$value.'.csv', 'r')) !== FALSE)
						{
							$header = fgetcsv($handle, 1000, ",");

							$token = 0;
							$query = "INSERT INTO predictions (id_exec,exe_time,bench,net,disk,maps,iosf,replication,iofilebuf,comp,blk_size,id_cluster,name,datanodes,headnodes,vm_OS,vm_cores,vm_RAM,provider,vm_size,type,pred_time,id_learner,instance,predict_code) VALUES ";
							while (($data = fgetcsv($handle, 1000, ",")) !== FALSE)
							{
								$specific_instance = implode(",",array_slice($data, 2, 19));
								if ($token != 0) { $query = $query.","; } $token = 1;
								$query = $query."('".implode("','",$data)."','".md5($config)."','".$specific_instance."','".(($value=='tt')?3:(($value=='tv')?2:1))."') ";								
							}

							if ($dbml->query($query) === FALSE) throw new \Exception('Error when saving into DB');
							fclose($handle);
						}
					}
					// TODO - Here residual files (cache, tr, tv, tt) can be removed
				}

				$must_wait = "NO";
				$count = 0;
				$max_x = $max_y = 0;
				$error_stats = '';

				$query = "SELECT exe_time, pred_time, instance FROM predictions WHERE id_learner='".md5($config)."' LIMIT 5000"; // FIXME - CLUMPSY PATCH FOR BYPASS THE BUG FROM HIGHCHARTS... REMEMBER TO ERASE THIS LIMIT WHEN THE BUG IS SOLVED
				$result = $dbml->query($query);
				foreach ($result as $row)
				{
					$jsonExecs[$count]['y'] = (int)$row['exe_time'];
					$jsonExecs[$count]['x'] = (int)$row['pred_time'];
					$jsonExecs[$count]['mydata'] = $row['instance'];

					if ((int)$row['exe_time'] > $max_y) $max_y = (int)$row['exe_time'];
					if ((int)$row['pred_time'] > $max_x) $max_x = (int)$row['pred_time'];
					$count++;
				}

				$query = "SELECT AVG(ABS(exe_time - pred_time)) AS MAE, AVG(ABS(exe_time - pred_time)/exe_time) AS RAE, predict_code FROM predictions WHERE id_learner='".md5($config)."' AND predict_code > 0 GROUP BY predict_code";
				$result = $dbml->query($query);
				foreach ($result as $row)
				{
					$error_stats = $error_stats.'Dataset: '.(($row['predict_code']==1)?'tr':(($row['predict_code']==2)?'tv':'tt')).' => MAE: '.$row['MAE'].' RAE: '.$row['RAE'].'<br/>';
				}
			}
		}
		catch(\Exception $e)
		{
			$this->container->getTwig ()->addGlobal ( 'message', $e->getMessage () . "\n" );
			$jsonExecs = '[]';
			$max_x = $max_y = 0;
			$must_wait = 'NO';
		}
		echo $this->container->getTwig()->render('mltemplate/mlprediction.html.twig',
			array(
				'selected' => 'mlprediction',
				'jsonExecs' => json_encode($jsonExecs),
				'max_p' => min(array($max_x,$max_y)),
				'benchs' => $params['benchs'],
				'nets' => $params['nets'],
				'disks' => $params['disks'],
				'blk_sizes' => $params['blk_sizes'],
				'comps' => $params['comps'],
				'id_clusters' => $params['id_clusters'],
				'mapss' => $params['mapss'],
				'replications' => $params['replications'],
				'iosfs' => $params['iosfs'],
				'iofilebufs' => $params['iofilebufs'],
				'unrestricted' => $unrestricted,
				'learn' => $learn_param,
				'must_wait' => $must_wait,
				'instance' => $instance,
				'error_stats' => $error_stats,
				'options' => Utils::getFilterOptions($db)
			)
		);
	}

	public function mlclearcacheAction()
	{
		try
		{
			if (file_exists(getcwd().'/cache/query/record.data'))
			{
				$output = array();

				if (array_key_exists("ccache",$_GET))
				{
					if (($fh = fopen(getcwd().'/cache/query/record.data', 'r')) !== FALSE)
					{
						while (!feof($fh))
						{
							$line = fgets($fh, 4096);
							$fts = explode(" : ",$line);

							$command = 'rm '.getcwd().'/cache/query/'.$fts[0].'-*';
							$output[] = shell_exec($command);
						}
						fclose($fh);

						$command = 'rm '.getcwd().'/cache/query/record.data';
						$output[] = shell_exec($command);
					}
				}
			}
			else $this->container->getTwig ()->addGlobal ( 'message', "ML cache cleared.\n" );
		}
		catch(Exception $e)
		{
			$this->container->getTwig ()->addGlobal ( 'message', $e->getMessage () . "\n" );
			$output = array();
		}
		echo $this->container->getTwig()->render('mltemplate/mlclearcache.html.twig',
			array(
				'selected' => 'mlclearcache',
				'output' => '<li>'.implode("</li><li>",$output).'</li>'
			)
		);
	}
}
?>
