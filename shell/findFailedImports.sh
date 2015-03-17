#!/bin/bash
#simple script to check if folder has been imported before to move it or not

#if no param is passed, then we need to source the main file
if [ ! "$1" ] ; then
  CUR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  source "$CUR_DIR/common/include_process_jobs.sh"
fi

#TODO add the query

#select distinct(substring(exec, 1, (locate('/',exec)-1)))
#from execs e join clusters c using (id_cluster) where exe_time > 100 and type != 'PaaS'
#and (
#id_exec NOT IN(select distinct (id_exec) from JOB_status where id_exec is not null)
#OR
#id_exec NOT IN(select distinct (id_exec) from SAR_cpu where id_exec is not null)
#)
#;

failed_jobs="20131221_090634_conf_IB_HDD_b_m24_i10_r2_I65536_c0_z64
20131222_181404_conf_IB_SSD_b_m12_i10_r1_I65536_c0_z64
20131222_183626_conf_IB_SSD_b_m12_i10_r1_I65536_c1_z64
20131222_190820_conf_IB_SSD_b_m16_i10_r1_I65536_c0_z64
20131222_193734_conf_IB_SSD_b_m16_i10_r1_I65536_c1_z64
20131222_200755_conf_IB_SSD_b_m24_i10_r1_I65536_c0_z64
20131222_203940_conf_IB_SSD_b_m24_i10_r1_I65536_c1_z64
20131222_211357_conf_IB_SSD_b_m12_i10_r2_I65536_c0_z64
20131222_213931_conf_IB_SSD_b_m12_i10_r2_I65536_c1_z64
20131222_221310_conf_IB_SSD_b_m16_i10_r2_I65536_c0_z64
20131222_224710_conf_IB_SSD_b_m16_i10_r2_I65536_c1_z64
20131222_232328_conf_IB_SSD_b_m24_i10_r2_I65536_c0_z64
20131222_235836_conf_IB_SSD_b_m24_i10_r2_I65536_c1_z64
20131223_003444_conf_IB_SSD_b_m12_i10_r3_I65536_c0_z64
20131223_010340_conf_IB_SSD_b_m12_i10_r3_I65536_c1_z64
20131223_013953_conf_IB_SSD_b_m16_i10_r3_I65536_c0_z64
20131223_021510_conf_IB_SSD_b_m16_i10_r3_I65536_c1_z64
20131223_025157_conf_IB_SSD_b_m24_i10_r3_I65536_c0_z64
20131223_032737_conf_IB_SSD_b_m24_i10_r3_I65536_c1_z64
20131223_041140_conf_ETH_SSD_b_m12_i10_r1_I65536_c0_z64
20131223_043736_conf_ETH_SSD_b_m12_i10_r1_I65536_c1_z64
20131223_052428_conf_ETH_SSD_b_m16_i10_r1_I65536_c0_z64
20131223_061144_conf_ETH_SSD_b_m16_i10_r1_I65536_c1_z64
20131223_065905_conf_ETH_SSD_b_m24_i10_r1_I65536_c0_z64
20131223_074554_conf_ETH_SSD_b_m24_i10_r1_I65536_c1_z64
20131223_083954_conf_ETH_SSD_b_m12_i10_r2_I65536_c0_z64
20131223_092407_conf_ETH_SSD_b_m12_i10_r2_I65536_c1_z64
20131223_102206_conf_ETH_SSD_b_m16_i10_r2_I65536_c0_z64
20131223_112735_conf_ETH_SSD_b_m16_i10_r2_I65536_c1_z64
20131223_123539_conf_ETH_SSD_b_m24_i10_r2_I65536_c0_z64
20131223_134032_conf_ETH_SSD_b_m24_i10_r2_I65536_c1_z64
20131223_150053_conf_ETH_SSD_b_m12_i10_r3_I65536_c0_z64
20131223_161016_conf_ETH_SSD_b_m12_i10_r3_I65536_c1_z64
20131223_172712_conf_ETH_SSD_b_m16_i10_r3_I65536_c0_z64
20131223_184223_conf_ETH_SSD_b_m16_i10_r3_I65536_c1_z64
20131223_195920_conf_ETH_SSD_b_m24_i10_r3_I65536_c0_z64
20131223_211427_conf_ETH_SSD_b_m24_i10_r3_I65536_c1_z64
20131223_225200_conf_IB_HDD_b_m12_i10_r1_I65536_c0_z64
20131224_000326_conf_IB_HDD_b_m12_i10_r1_I65536_c1_z64
20131224_015929_conf_IB_HDD_b_m16_i10_r1_I65536_c0_z64
20131224_035729_conf_IB_HDD_b_m16_i10_r1_I65536_c1_z64
20131224_050455_conf_IB_HDD_b_m24_i10_r1_I65536_c0_z64
20131224_054318_conf_IB_HDD_b_m24_i10_r1_I65536_c0_z64
20131224_074049_conf_IB_HDD_b_m24_i10_r1_I65536_c1_z64
20131224_101009_conf_IB_HDD_b_m12_i10_r2_I65536_c0_z64
20131224_115837_conf_IB_HDD_b_m12_i10_r2_I65536_c1_z64
20131224_142809_conf_IB_HDD_b_m16_i10_r2_I65536_c0_z64
20131224_165313_conf_IB_HDD_b_m16_i10_r2_I65536_c1_z64
20131224_192126_conf_IB_HDD_b_m24_i10_r2_I65536_c0_z64
20131224_215309_conf_IB_HDD_b_m24_i10_r2_I65536_c1_z64
20131225_003625_conf_IB_HDD_b_m12_i10_r3_I65536_c0_z64
20131225_031154_conf_IB_HDD_b_m12_i10_r3_I65536_c1_z64
20131225_070146_conf_IB_HDD_b_m16_i10_r3_I65536_c0_z64
20131225_105032_conf_IB_HDD_b_m16_i10_r3_I65536_c1_z64
20131225_135633_conf_IB_HDD_b_m24_i10_r3_I65536_c0_z64
20131225_172718_conf_IB_HDD_b_m24_i10_r3_I65536_c1_z64
20131225_202322_conf_ETH_HDD_b_m12_i10_r1_I65536_c0_z64
20131225_212952_conf_ETH_HDD_b_m12_i10_r1_I65536_c1_z64
20131225_230621_conf_ETH_HDD_b_m16_i10_r1_I65536_c0_z64
20131226_005404_conf_ETH_HDD_b_m16_i10_r1_I65536_c1_z64
20131226_023857_conf_ETH_HDD_b_m24_i10_r1_I65536_c0_z64
20131226_042652_conf_ETH_HDD_b_m24_i10_r1_I65536_c1_z64
20131226_063012_conf_ETH_HDD_b_m12_i10_r2_I65536_c0_z64
20131226_081238_conf_ETH_HDD_b_m12_i10_r2_I65536_c1_z64
20131226_103522_conf_ETH_HDD_b_m16_i10_r2_I65536_c0_z64
20131226_130323_conf_ETH_HDD_b_m16_i10_r2_I65536_c1_z64
20131226_153241_conf_ETH_HDD_b_m24_i10_r2_I65536_c0_z64
20131226_180132_conf_ETH_HDD_b_m24_i10_r2_I65536_c1_z64
20131226_211744_conf_ETH_HDD_b_m12_i10_r3_I65536_c0_z64
20131227_002844_conf_ETH_HDD_b_m12_i10_r3_I65536_c1_z64
20131227_043549_conf_ETH_HDD_b_m16_i10_r3_I65536_c0_z64
20131227_080207_conf_ETH_HDD_b_m16_i10_r3_I65536_c1_z64
20131227_114715_conf_ETH_HDD_b_m24_i10_r3_I65536_c0_z64
20131227_145557_conf_ETH_HDD_b_m24_i10_r3_I65536_c1_z64
20131231_130116_conf_IB_SSD_b_m12_i5_r1_I32768_c0_z32
20131231_160735_conf_IB_SSD_b_m12_i5_r1_I32768_c0_z128
20131231_163301_conf_IB_SSD_b_m12_i5_r1_I32768_c0_z256
20131231_165758_conf_IB_SSD_b_m12_i5_r1_I32768_c0_z64
20131231_172308_conf_IB_SSD_b_m12_i5_r1_I131072_c0_z32
20131231_174748_conf_IB_SSD_b_m12_i5_r1_I131072_c0_z128
20131231_181334_conf_IB_SSD_b_m12_i5_r1_I131072_c0_z256
20131231_183905_conf_IB_SSD_b_m12_i5_r1_I131072_c0_z64
20131231_190503_conf_IB_SSD_b_m12_i5_r1_I4096_c0_z32
20131231_193109_conf_IB_SSD_b_m12_i5_r1_I4096_c0_z128
20131231_195707_conf_IB_SSD_b_m12_i5_r1_I4096_c0_z256
20131231_202304_conf_IB_SSD_b_m12_i5_r1_I4096_c0_z64
20131231_204759_conf_IB_SSD_b_m12_i5_r1_I65536_c0_z32
20131231_211329_conf_IB_SSD_b_m12_i5_r1_I65536_c0_z128
20131231_213834_conf_IB_SSD_b_m12_i5_r1_I65536_c0_z256
20131231_220507_conf_IB_SSD_b_m12_i5_r1_I65536_c0_z64
20131231_223048_conf_IB_SSD_b_m12_i10_r1_I32768_c0_z32
20131231_225643_conf_IB_SSD_b_m12_i10_r1_I32768_c0_z128
20131231_232202_conf_IB_SSD_b_m12_i10_r1_I32768_c0_z256
20131231_234744_conf_IB_SSD_b_m12_i10_r1_I32768_c0_z64
20140101_001347_conf_IB_SSD_b_m12_i10_r1_I131072_c0_z32
20140101_003924_conf_IB_SSD_b_m12_i10_r1_I131072_c0_z128
20140101_010441_conf_IB_SSD_b_m12_i10_r1_I131072_c0_z256
20140101_013017_conf_IB_SSD_b_m12_i10_r1_I131072_c0_z64
20140101_015605_conf_IB_SSD_b_m12_i10_r1_I4096_c0_z32
20140101_022234_conf_IB_SSD_b_m12_i10_r1_I4096_c0_z128
20140101_024847_conf_IB_SSD_b_m12_i10_r1_I4096_c0_z256
20140101_031511_conf_IB_SSD_b_m12_i10_r1_I4096_c0_z64
20140101_034040_conf_IB_SSD_b_m12_i10_r1_I65536_c0_z32
20140101_040615_conf_IB_SSD_b_m12_i10_r1_I65536_c0_z128
20140101_043235_conf_IB_SSD_b_m12_i10_r1_I65536_c0_z256
20140101_045752_conf_IB_SSD_b_m12_i10_r1_I65536_c0_z64
20140101_052317_conf_IB_SSD_b_m12_i20_r1_I32768_c0_z32
20140101_054845_conf_IB_SSD_b_m12_i20_r1_I32768_c0_z128
20140101_061357_conf_IB_SSD_b_m12_i20_r1_I32768_c0_z256
20140101_063907_conf_IB_SSD_b_m12_i20_r1_I32768_c0_z64
20140101_070452_conf_IB_SSD_b_m12_i20_r1_I131072_c0_z32
20140101_073010_conf_IB_SSD_b_m12_i20_r1_I131072_c0_z128
20140101_075525_conf_IB_SSD_b_m12_i20_r1_I131072_c0_z256
20140101_082047_conf_IB_SSD_b_m12_i20_r1_I131072_c0_z64
20140101_084722_conf_IB_SSD_b_m12_i20_r1_I4096_c0_z32
20140101_091357_conf_IB_SSD_b_m12_i20_r1_I4096_c0_z128
20140101_094009_conf_IB_SSD_b_m12_i20_r1_I4096_c0_z256
20140101_100612_conf_IB_SSD_b_m12_i20_r1_I4096_c0_z64
20140101_103134_conf_IB_SSD_b_m12_i20_r1_I65536_c0_z32
20140101_105657_conf_IB_SSD_b_m12_i20_r1_I65536_c0_z128
20140101_112208_conf_IB_SSD_b_m12_i20_r1_I65536_c0_z256
20140101_114803_conf_IB_SSD_b_m12_i20_r1_I65536_c0_z64
20140101_121319_conf_IB_SSD_b_m12_i50_r1_I32768_c0_z32
20140101_123902_conf_IB_SSD_b_m12_i50_r1_I32768_c0_z128
20140101_130518_conf_IB_SSD_b_m12_i50_r1_I32768_c0_z256
20140101_133014_conf_IB_SSD_b_m12_i50_r1_I32768_c0_z64
20140101_135527_conf_IB_SSD_b_m12_i50_r1_I131072_c0_z32
20140101_142110_conf_IB_SSD_b_m12_i50_r1_I131072_c0_z128
20140101_144701_conf_IB_SSD_b_m12_i50_r1_I131072_c0_z256
20140101_151212_conf_IB_SSD_b_m12_i50_r1_I131072_c0_z64
20140101_153846_conf_IB_SSD_b_m12_i50_r1_I4096_c0_z32
20140101_160603_conf_IB_SSD_b_m12_i50_r1_I4096_c0_z128
20140101_163214_conf_IB_SSD_b_m12_i50_r1_I4096_c0_z256
20140101_165832_conf_IB_SSD_b_m12_i50_r1_I4096_c0_z64
20140101_172415_conf_IB_SSD_b_m12_i50_r1_I65536_c0_z32
20140101_174909_conf_IB_SSD_b_m12_i50_r1_I65536_c0_z128
20140101_181428_conf_IB_SSD_b_m12_i50_r1_I65536_c0_z256
20140101_183957_conf_IB_SSD_b_m12_i50_r1_I65536_c0_z64
20140101_190546_conf_IB_SSD_b_m12_i5_r3_I32768_c0_z32
20140101_193130_conf_IB_SSD_b_m12_i5_r3_I32768_c0_z128
20140101_195605_conf_IB_SSD_b_m12_i5_r3_I32768_c0_z256
20140101_202301_conf_IB_SSD_b_m12_i5_r3_I32768_c0_z64
20140101_204852_conf_IB_SSD_b_m12_i5_r3_I131072_c0_z32
20140101_211433_conf_IB_SSD_b_m12_i5_r3_I131072_c0_z128
20140101_213941_conf_IB_SSD_b_m12_i5_r3_I131072_c0_z256
20140101_220525_conf_IB_SSD_b_m12_i5_r3_I131072_c0_z64
20140101_223313_conf_IB_SSD_b_m12_i5_r3_I4096_c0_z32
20140101_225900_conf_IB_SSD_b_m12_i5_r3_I4096_c0_z128
20140101_232532_conf_IB_SSD_b_m12_i5_r3_I4096_c0_z256
20140101_235108_conf_IB_SSD_b_m12_i5_r3_I4096_c0_z64
20140102_000014_conf_IB_SSD_b_m12_i5_r3_I65536_c0_z32
20140102_002546_conf_IB_SSD_b_m12_i5_r3_I65536_c0_z128
20140102_005130_conf_IB_SSD_b_m12_i5_r3_I65536_c0_z256
20140102_011705_conf_IB_SSD_b_m12_i5_r3_I65536_c0_z64
20140102_014234_conf_IB_SSD_b_m12_i10_r3_I32768_c0_z32
20140102_020840_conf_IB_SSD_b_m12_i10_r3_I32768_c0_z128
20140102_023425_conf_IB_SSD_b_m12_i10_r3_I32768_c0_z256
20140102_030017_conf_IB_SSD_b_m12_i10_r3_I32768_c0_z64
20140102_032554_conf_IB_SSD_b_m12_i10_r3_I131072_c0_z32
20140102_035145_conf_IB_SSD_b_m12_i10_r3_I131072_c0_z128
20140102_041922_conf_IB_SSD_b_m12_i10_r3_I131072_c0_z256
20140102_044431_conf_IB_SSD_b_m12_i10_r3_I131072_c0_z64
20140102_051106_conf_IB_SSD_b_m12_i10_r3_I4096_c0_z32
20140102_053745_conf_IB_SSD_b_m12_i10_r3_I4096_c0_z128
20140102_060412_conf_IB_SSD_b_m12_i10_r3_I4096_c0_z256
20140102_063008_conf_IB_SSD_b_m12_i10_r3_I4096_c0_z64
20140102_065537_conf_IB_SSD_b_m12_i10_r3_I65536_c0_z32
20140102_072110_conf_IB_SSD_b_m12_i10_r3_I65536_c0_z128
20140102_074657_conf_IB_SSD_b_m12_i10_r3_I65536_c0_z256
20140102_081221_conf_IB_SSD_b_m12_i10_r3_I65536_c0_z64
20140102_083741_conf_IB_SSD_b_m12_i20_r3_I32768_c0_z32
20140102_090330_conf_IB_SSD_b_m12_i20_r3_I32768_c0_z128
20140102_092847_conf_IB_SSD_b_m12_i20_r3_I32768_c0_z256
20140102_095431_conf_IB_SSD_b_m12_i20_r3_I32768_c0_z64
20140102_102020_conf_IB_SSD_b_m12_i20_r3_I131072_c0_z32
20140102_104605_conf_IB_SSD_b_m12_i20_r3_I131072_c0_z128
20140102_111118_conf_IB_SSD_b_m12_i20_r3_I131072_c0_z256
20140102_113738_conf_IB_SSD_b_m12_i20_r3_I131072_c0_z64
20140102_120409_conf_IB_SSD_b_m12_i20_r3_I4096_c0_z32
20140102_123031_conf_IB_SSD_b_m12_i20_r3_I4096_c0_z128
20140102_125722_conf_IB_SSD_b_m12_i20_r3_I4096_c0_z256
20140102_132417_conf_IB_SSD_b_m12_i20_r3_I4096_c0_z64
20140102_135114_conf_IB_SSD_b_m12_i20_r3_I65536_c0_z32
20140102_141656_conf_IB_SSD_b_m12_i20_r3_I65536_c0_z128
20140102_144225_conf_IB_SSD_b_m12_i20_r3_I65536_c0_z256
20140102_150827_conf_IB_SSD_b_m12_i20_r3_I65536_c0_z64
20140102_153340_conf_IB_SSD_b_m12_i50_r3_I32768_c0_z32
20140102_155948_conf_IB_SSD_b_m12_i50_r3_I32768_c0_z128
20140102_162505_conf_IB_SSD_b_m12_i50_r3_I32768_c0_z256
20140102_165059_conf_IB_SSD_b_m12_i50_r3_I32768_c0_z64
20140102_171642_conf_IB_SSD_b_m12_i50_r3_I131072_c0_z32
20140102_174217_conf_IB_SSD_b_m12_i50_r3_I131072_c0_z128
20140102_180724_conf_IB_SSD_b_m12_i50_r3_I131072_c0_z256
20140102_183303_conf_IB_SSD_b_m12_i50_r3_I131072_c0_z64
20140102_185937_conf_IB_SSD_b_m12_i50_r3_I4096_c0_z32
20140102_192549_conf_IB_SSD_b_m12_i50_r3_I4096_c0_z128
20140102_195206_conf_IB_SSD_b_m12_i50_r3_I4096_c0_z256
20140102_201749_conf_IB_SSD_b_m12_i50_r3_I4096_c0_z64
20140102_204417_conf_IB_SSD_b_m12_i50_r3_I65536_c0_z32
20140102_210952_conf_IB_SSD_b_m12_i50_r3_I65536_c0_z128
20140102_213551_conf_IB_SSD_b_m12_i50_r3_I65536_c0_z256
20140102_220217_conf_IB_SSD_b_m12_i50_r3_I65536_c0_z64
20140102_222952_conf_ETH_SSD_b_m12_i5_r1_I32768_c0_z32
20140102_225743_conf_ETH_SSD_b_m12_i5_r1_I32768_c0_z128
20140102_232508_conf_ETH_SSD_b_m12_i5_r1_I32768_c0_z256
20140102_235203_conf_ETH_SSD_b_m12_i5_r1_I32768_c0_z64
20140103_001959_conf_ETH_SSD_b_m12_i5_r1_I131072_c0_z32
20140103_004706_conf_ETH_SSD_b_m12_i5_r1_I131072_c0_z128
20140103_011432_conf_ETH_SSD_b_m12_i5_r1_I131072_c0_z256
20140103_014159_conf_ETH_SSD_b_m12_i5_r1_I131072_c0_z64
20140103_021147_conf_ETH_SSD_b_m12_i5_r1_I4096_c0_z32
20140103_023951_conf_ETH_SSD_b_m12_i5_r1_I4096_c0_z128
20140103_030808_conf_ETH_SSD_b_m12_i5_r1_I4096_c0_z256
20140103_033528_conf_ETH_SSD_b_m12_i5_r1_I4096_c0_z64
20140103_040230_conf_ETH_SSD_b_m12_i5_r1_I65536_c0_z32
20140103_043006_conf_ETH_SSD_b_m12_i5_r1_I65536_c0_z128
20140103_045721_conf_ETH_SSD_b_m12_i5_r1_I65536_c0_z256
20140103_052418_conf_ETH_SSD_b_m12_i5_r1_I65536_c0_z64
20140103_055049_conf_ETH_SSD_b_m12_i10_r1_I32768_c0_z32
20140103_061731_conf_ETH_SSD_b_m12_i10_r1_I32768_c0_z128
20140103_064503_conf_ETH_SSD_b_m12_i10_r1_I32768_c0_z256
20140103_073805_conf_ETH_SSD_b_m12_i10_r1_I32768_c0_z64
20140103_080551_conf_ETH_SSD_b_m12_i10_r1_I131072_c0_z32
20140103_083422_conf_ETH_SSD_b_m12_i10_r1_I131072_c0_z128
20140103_090155_conf_ETH_SSD_b_m12_i10_r1_I131072_c0_z256
20140103_092933_conf_ETH_SSD_b_m12_i10_r1_I131072_c0_z64
20140103_095713_conf_ETH_SSD_b_m12_i10_r1_I4096_c0_z32
20140103_102532_conf_ETH_SSD_b_m12_i10_r1_I4096_c0_z128
20140103_105354_conf_ETH_SSD_b_m12_i10_r1_I4096_c0_z256
20140103_112151_conf_ETH_SSD_b_m12_i10_r1_I4096_c0_z64
20140103_114847_conf_ETH_SSD_b_m12_i10_r1_I65536_c0_z32
20140103_121538_conf_ETH_SSD_b_m12_i10_r1_I65536_c0_z128
20140103_124319_conf_ETH_SSD_b_m12_i10_r1_I65536_c0_z256
20140103_131016_conf_ETH_SSD_b_m12_i10_r1_I65536_c0_z64
20140103_133642_conf_ETH_SSD_b_m12_i20_r1_I32768_c0_z32
20140103_140422_conf_ETH_SSD_b_m12_i20_r1_I32768_c0_z128
20140103_143146_conf_ETH_SSD_b_m12_i20_r1_I32768_c0_z256
20140103_145908_conf_ETH_SSD_b_m12_i20_r1_I32768_c0_z64
20140103_152702_conf_ETH_SSD_b_m12_i20_r1_I131072_c0_z32
20140103_155433_conf_ETH_SSD_b_m12_i20_r1_I131072_c0_z128
20140103_162142_conf_ETH_SSD_b_m12_i20_r1_I131072_c0_z256
20140103_164925_conf_ETH_SSD_b_m12_i20_r1_I131072_c0_z64
20140103_171044_conf_ETH_SSD_b_m12_i20_r1_I4096_c0_z32
20140103_173734_conf_ETH_SSD_b_m12_i20_r1_I4096_c0_z128
20140103_180515_conf_ETH_SSD_b_m12_i20_r1_I4096_c0_z256
20140103_183238_conf_ETH_SSD_b_m12_i20_r1_I4096_c0_z64
20140103_185935_conf_ETH_SSD_b_m12_i20_r1_I65536_c0_z32
20140103_192552_conf_ETH_SSD_b_m12_i20_r1_I65536_c0_z128
20140103_195312_conf_ETH_SSD_b_m12_i20_r1_I65536_c0_z256
20140103_202022_conf_ETH_SSD_b_m12_i20_r1_I65536_c0_z64
20140103_204724_conf_ETH_SSD_b_m12_i50_r1_I32768_c0_z32
20140103_211431_conf_ETH_SSD_b_m12_i50_r1_I32768_c0_z128
20140103_214132_conf_ETH_SSD_b_m12_i50_r1_I32768_c0_z256
20140103_220830_conf_ETH_SSD_b_m12_i50_r1_I32768_c0_z64
20140103_223529_conf_ETH_SSD_b_m12_i50_r1_I131072_c0_z32
20140103_230250_conf_ETH_SSD_b_m12_i50_r1_I131072_c0_z128
20140103_232926_conf_ETH_SSD_b_m12_i50_r1_I131072_c0_z256
20140103_235611_conf_ETH_SSD_b_m12_i50_r1_I131072_c0_z64
20140104_002445_conf_ETH_SSD_b_m12_i50_r1_I4096_c0_z32
20140104_005216_conf_ETH_SSD_b_m12_i50_r1_I4096_c0_z128
20140104_012005_conf_ETH_SSD_b_m12_i50_r1_I4096_c0_z256
20140104_014806_conf_ETH_SSD_b_m12_i50_r1_I4096_c0_z64
20140104_021455_conf_ETH_SSD_b_m12_i50_r1_I65536_c0_z32
20140104_024202_conf_ETH_SSD_b_m12_i50_r1_I65536_c0_z128
20140104_030824_conf_ETH_SSD_b_m12_i50_r1_I65536_c0_z256
20140104_033510_conf_ETH_SSD_b_m12_i50_r1_I65536_c0_z64
20140104_040229_conf_ETH_SSD_b_m12_i5_r3_I32768_c0_z32
20140104_042928_conf_ETH_SSD_b_m12_i5_r3_I32768_c0_z128
20140104_045631_conf_ETH_SSD_b_m12_i5_r3_I32768_c0_z256
20140104_052403_conf_ETH_SSD_b_m12_i5_r3_I32768_c0_z64
20140104_055047_conf_ETH_SSD_b_m12_i5_r3_I131072_c0_z32
20140104_061737_conf_ETH_SSD_b_m12_i5_r3_I131072_c0_z128
20140104_064415_conf_ETH_SSD_b_m12_i5_r3_I131072_c0_z256
20140104_071055_conf_ETH_SSD_b_m12_i5_r3_I131072_c0_z64
20140104_073841_conf_ETH_SSD_b_m12_i5_r3_I4096_c0_z32
20140104_080638_conf_ETH_SSD_b_m12_i5_r3_I4096_c0_z128
20140104_083422_conf_ETH_SSD_b_m12_i5_r3_I4096_c0_z256
20140104_090203_conf_ETH_SSD_b_m12_i5_r3_I4096_c0_z64
20140104_092921_conf_ETH_SSD_b_m12_i5_r3_I65536_c0_z32
20140104_095707_conf_ETH_SSD_b_m12_i5_r3_I65536_c0_z128
20140104_102339_conf_ETH_SSD_b_m12_i5_r3_I65536_c0_z256
20140104_105103_conf_ETH_SSD_b_m12_i5_r3_I65536_c0_z64
20140104_111732_conf_ETH_SSD_b_m12_i10_r3_I32768_c0_z32
20140104_114439_conf_ETH_SSD_b_m12_i10_r3_I32768_c0_z128
20140104_121128_conf_ETH_SSD_b_m12_i10_r3_I32768_c0_z256
20140104_123846_conf_ETH_SSD_b_m12_i10_r3_I32768_c0_z64
20140104_130536_conf_ETH_SSD_b_m12_i10_r3_I131072_c0_z32
20140104_133240_conf_ETH_SSD_b_m12_i10_r3_I131072_c0_z128
20140104_140059_conf_ETH_SSD_b_m12_i10_r3_I131072_c0_z256
20140104_142815_conf_ETH_SSD_b_m12_i10_r3_I131072_c0_z64
20140104_145601_conf_ETH_SSD_b_m12_i10_r3_I4096_c0_z32
20140104_152411_conf_ETH_SSD_b_m12_i10_r3_I4096_c0_z128
20140104_155157_conf_ETH_SSD_b_m12_i10_r3_I4096_c0_z256
20140303_035234_conf_IB_SSD_b_m12_i10_r1_I65536_c3_z128
20140312_135323_conf_ETH_HDD_b_m8_i10_r1_I65536_c0_z64_az
20140312_153752_conf_ETH_HDD_b_m8_i10_r1_I65536_c0_z64_az
20140312_171845_conf_ETH_HDD_b_m8_i10_r1_I65536_c0_z64_az
20140312_185920_conf_ETH_HDD_b_m8_i10_r1_I65536_c0_z64_az
20140312_202257_conf_ETH_HDD_b_m8_i10_r1_I65536_c0_z64_az
20140312_213054_conf_ETH_HDD_b_m8_i10_r1_I65536_c0_z64_az
20140313_174648_conf_ETH_HDD_b_m8_i10_r1_I65536_c0_z64_az
20140313_194112_conf_ETH_HDD_b_m8_i10_r1_I65536_c0_z64_az
20140313_214553_conf_ETH_HDD_b_m8_i10_r1_I65536_c0_z64_az
20140313_234441_conf_ETH_HDD_b_m8_i10_r1_I65536_c0_z64_az
20140314_001550_conf_ETH_HDD_b_m8_i10_r1_I65536_c0_z64_az
20140314_004741_conf_ETH_HDD_b_m8_i10_r1_I65536_c0_z64_az
20140314_011913_conf_ETH_HDD_b_m8_i10_r1_I65536_c0_z64_az
20140314_091815_conf_ETH_HDD_b_m8_i10_r1_I65536_c0_z64_az
20140314_100431_conf_ETH_HDD_b_m8_i10_r1_I65536_c0_z64_az
20140314_130519_conf_ETH_HDD_b_m8_i10_r1_I65536_c0_z64_az
20140314_141243_conf_ETH_HDD_b_m8_i10_r1_I65536_c0_z64_az
20140314_164253_conf_ETH_HDD_b_m8_i10_r1_I65536_c0_z64_az
20140314_184022_conf_ETH_HDD_b_m8_i10_r1_I65536_c0_z64_az
20140314_192534_conf_ETH_HDD_b_m8_i10_r1_I65536_c0_z64_az
20140314_201357_conf_ETH_HDD_b_m8_i10_r1_I65536_c0_z64_az
20140314_215241_conf_ETH_HDD_b_m8_i10_r1_I65536_c0_z64_az
20140418_145640_conf_ETH_RL1_b_m10_i10_r2_I65536_c1_z32_az
20140621_153821_conf_ETH_RL2_b_m10_i10_r3_I65536_c0_z64_az
20140827_135423_conf_ETH_HDD_b_m8_i10_r1_I65536_c0_z64_al-03
20140912_101615_conf_ETH_HDD_b_m8_i10_r2_I65536_c2_z128_al-03
20140915_120404_conf_ETH_RL1_b_m8_i10_r2_I65536_c2_z64_al-04
20140915_212212_conf_ETH_RL1_b_m8_i10_r2_I65536_c2_z64_al-04
20140918_102934_conf_ETH_HDD_b_m8_i10_r1_I65536_c0_z256_al-04
20140920_034050_conf_ETH_HDD_b_m6_i10_r3_I65536_c1_z128_al-03
20140920_064415_conf_ETH_HDD_b_m6_i10_r3_I65536_c1_z256_al-03
20140921_112404_conf_ETH_HDD_b_m6_i10_r3_I65536_c2_z256_al-03
20140921_132125_conf_ETH_HDD_b_m8_i10_r1_I65536_c3_z64_al-05
20140923_161149_conf_ETH_HDD_b_m6_i10_r1_I65536_c2_z64_al-04
20140925_144607_conf_ETH_HDD_b_m10_i10_r1_I65536_c0_z64_al-04
20140925_213723_conf_ETH_HDD_b_m10_i10_r3_I65536_c1_z32_al-03
20140927_223920_conf_ETH_HDD_b_m10_i10_r3_I65536_c3_z32_al-03
20140928_133331_conf_ETH_HDD_b_m10_i10_r3_I65536_c3_z128_al-03
20140928_221523_conf_ETH_HDD_b_m10_i10_r1_I65536_c3_z64_al-04
20140930_001000_conf_ETH_HDD_b_m4_i10_r1_I65536_c0_z64_al-04
20141001_001035_conf_ETH_HDD_b_m4_i10_r1_I65536_c0_z256_al-04
20141001_063037_conf_ETH_HDD_b_m4_i10_r3_I65536_c1_z256_al-03
20141002_135953_conf_ETH_HDD_b_m4_i10_r3_I65536_c2_z256_al-03
20141006_125159_conf_ETH_HDD_b_m4_i10_r1_I65536_c3_z64_al-04
20141008_081904_conf_ETH_HDD_b_m8_i10_r2_I65536_c0_z128_al-04
20141011_072330_conf_ETH_HDD_b_m8_i10_r1_I65536_c1_z64_al-03
20141011_152206_conf_ETH_HDD_b_m8_i10_r1_I65536_c1_z64_al-03
20141012_160622_conf_ETH_HDD_b_m8_i10_r1_I65536_c2_z32_al-04
20141013_143402_conf_ETH_HDD_b_m8_i10_r1_I65536_c3_z128_al-04
20141013_212757_conf_ETH_HDD_b_m8_i10_r1_I65536_c3_z256_al-04
20141019_111114_conf_ETH_HDD_b_m6_i10_r1_I65536_c2_z256_al-05
20141020_165445_conf_ETH_HDD_b_m4_i10_r1_I65536_c0_z64_al-08
20141021_101409_conf_ETH_HDD_b_m4_i10_r1_I65536_c0_z64_al-08
20141021_160215_conf_ETH_HDD_b_m8_i10_r1_I65536_c0_z64_al-08
20141021_203704_conf_ETH_HDD_b_m10_i10_r1_I65536_c0_z64_al-05
20141029_152931_conf_ETH_HDD_b_m4_i10_r1_I65536_c0_z64_al-08
20141029_172307_conf_ETH_HDD_b_m4_i10_r1_I65536_c0_z64_al-08
20141029_183900_conf_ETH_HDD_b_m8_i10_r1_I65536_c0_z64_al-08
20141029_190138_conf_ETH_HDD_b_m2_i10_r1_I65536_c0_z64_al-08
20141029_190252_conf_ETH_HDD_b_m8_i10_r1_I65536_c0_z64_al-08
20141029_204832_conf_ETH_HDD_b_m4_i10_r1_I65536_c0_z64_al-08
20141029_221229_conf_ETH_HDD_b_m8_i10_r1_I65536_c0_z256_al-08
20141029_224725_conf_ETH_HDD_b_m8_i10_r1_I65536_c0_z256_al-08
20141029_224931_conf_ETH_HDD_b_m2_i10_r1_I65536_c0_z64_al-08
20141030_113830_conf_ETH_HDD_b_m8_i10_r1_I65536_c1_z128_al-08
20141030_222754_conf_ETH_HDD_b_m8_i10_r1_I65536_c2_z64_al-08
20141031_071131_conf_ETH_HDD_b_m8_i10_r1_I65536_c3_z32_al-08
20141031_093930_conf_ETH_HDD_b_m8_i10_r1_I65536_c3_z64_al-08
20141102_185443_conf_ETH_HDD_b_m4_i10_r1_I65536_c3_z64_al-05
20141106_174056_conf_ETH_RL3_b_m6_i10_r3_I65536_c1_z64_al-08
20141106_221836_conf_ETH_RL3_b_m6_i10_r3_I65536_c1_z128_al-08
20141107_020819_conf_ETH_HDD_b_m8_i10_r2_I65536_c2_z64_al-05
20141107_023438_conf_ETH_RL3_b_m6_i10_r3_I65536_c1_z256_al-08
20141107_084429_conf_ETH_HDD_b_m8_i10_r2_I65536_c2_z32_al-05
20141107_144548_conf_ETH_RL3_b_m6_i10_r3_I65536_c2_z64_al-08
20141203_121454_conf_ETH_HDD_b_m8_i10_r1_I65536_c1_z128_S3_al-05
20141206_050735_conf_ETH_HDD_b_m4_i10_r1_I65536_c2_z64_S8_al-08
20141206_092426_conf_ETH_HDD_b_m8_i10_r1_I32768_c1_z256_S8_al-03
20141207_011619_conf_ETH_HDD_b_m8_i10_r1_I32768_c3_z32_S8_al-03
20141208_001303_conf_ETH_HDD_b_m8_i10_r1_I131072_c1_z256_S8_al-03
20141208_145908_conf_ETH_HDD_b_m6_i10_r1_I65536_c0_z64_S8_al-08
20141208_223204_conf_ETH_HDD_b_m4_i10_r1_I65536_c0_z64_S8_al-08
20141210_143838_conf_ETH_HDD_b_m8_i10_r1_I4096_c1_z32_S8_al-03
20141211_142434_conf_ETH_HDD_b_m8_i10_r1_I4096_c2_z32_S8_al-03
20141214_061121_conf_ETH_RL3_b_m4_i10_r3_I65536_c2_z64_S8_al-14
20141215_180421_conf_ETH_HDD_b_m8_i10_r1_I65536_c0_z128_S8_al-15
20141216_042721_conf_ETH_HDD_b_m8_i10_r1_I65536_c0_z256_S8_al-15
20141216_124456_conf_ETH_RL3_b_m4_i10_r3_I65536_c3_z128_S8_al-14
20141217_030355_conf_ETH_HDD_b_m8_i10_r1_I65536_c1_z64_S8_al-15
20141218_135300_conf_ETH_HDD_b_m8_i10_r1_I65536_c2_z128_S8_al-15
20141218_222013_conf_ETH_HDD_b_m8_i10_r1_I65536_c3_z64_S8_al-15
20141219_005514_conf_ETH_RL2_b_m8_i10_r1_I65536_c2_z128_S8_al-14
20141219_134826_conf_ETH_RL2_b_m8_i10_r1_I65536_c3_z128_S8_al-14
20141220_175255_conf_ETH_RL2_b_m6_i10_r1_I65536_c1_z32_S8_al-14
20141221_173157_conf_ETH_HDD_b_m6_i10_r1_I65536_c0_z32_S8_al-15
20141221_211001_conf_ETH_RL2_b_m6_i10_r1_I65536_c2_z256_S8_al-14
20141224_181522_conf_ETH_HDD_b_m6_i10_r1_I65536_c3_z64_S8_al-15
20141226_075706_conf_ETH_RL2_b_m4_i10_r1_I65536_c1_z64_S8_al-14
20141226_183648_conf_ETH_RL2_b_m4_i10_r1_I65536_c2_z64_S8_al-14
20141230_132617_conf_ETH_HDD_b_m4_i10_r1_I65536_c0_z256_S8_al-15
20141231_125235_conf_ETH_RL2_b_m8_i10_r2_I65536_c1_z256_S8_al-14
20141231_192625_conf_ETH_HDD_b_m4_i10_r1_I65536_c1_z256_S8_al-15
20150102_033304_conf_ETH_RL2_b_m6_i10_r2_I65536_c0_z64_S8_al-14
20150102_071439_conf_ETH_RL2_b_m6_i10_r2_I65536_c0_z32_S8_al-14
20150102_174152_conf_ETH_RL2_b_m6_i10_r2_I65536_c0_z128_S8_al-14
20150103_102745_conf_ETH_HDD_b_m8_i10_r2_I65536_c0_z64_S8_al-15
20150104_041213_conf_ETH_RL2_b_m6_i10_r2_I65536_c2_z128_S8_al-14
20150104_134853_conf_ETH_HDD_b_m8_i10_r2_I65536_c1_z64_S8_al-15
20150104_150122_conf_ETH_RL2_b_m6_i10_r2_I65536_c3_z64_S8_al-14
20150107_040712_conf_ETH_HDD_b_m8_i10_r1_I4096_c1_z64_S8_al-03
20150107_095137_conf_ETH_HDD_b_m8_i10_r1_I32768_c1_z64_S8_al-03
20150107_114036_conf_ETH_HDD_b_m4_i10_r1_I4096_c2_z32_S8_al-15
20150107_121832_conf_ETH_HDD_b_m4_i10_r1_I4096_c2_z64_S8_al-15
20150107_122719_conf_ETH_HDD_b_m8_i10_r1_I65536_c0_z64_S8_al-14
20150107_230917_conf_ETH_HDD_b_m6_i10_r1_I65536_c2_z64_S8_al-03
20150107_232947_conf_ETH_HDD_b_m6_i10_r1_I65536_c2_z32_S8_al-03
20150108_052041_conf_ETH_HDD_b_m8_i10_r1_I4096_c2_z128_S8_al-14
20150108_184341_conf_ETH_HDD_b_m4_i10_r1_I131072_c3_z256_S8_al-15
20150109_065103_conf_ETH_HDD_b_m4_i10_r1_I65536_c0_z64_S8_al-15
20150109_084923_conf_ETH_HDD_b_m8_i10_r1_I32768_c1_z64_S8_al-14
20150109_173610_conf_ETH_HDD_b_m8_i10_r1_I4096_c1_z32_S3_al-05
20150109_231956_conf_ETH_HDD_b_m6_i10_r1_I65536_c3_z64_S8_al-14
20150110_072345_conf_ETH_HDD_b_m6_i10_r1_I4096_c3_z64_S8_al-14
20150110_181717_conf_ETH_HDD_b_m6_i10_r1_I131072_c1_z64_S8_al-14
20150110_204936_conf_ETH_HDD_b_m6_i10_r1_I32768_c2_z32_S8_al-15
20150110_224631_conf_ETH_HDD_b_m8_i10_r2_I32768_c1_z128_S8_al-03
20150111_074723_conf_ETH_HDD_b_m6_i10_r1_I131072_c2_z256_S8_al-15
20150111_152018_conf_ETH_HDD_b_m10_i10_r1_I32768_c0_z64_S8_al-14
20150111_202455_conf_ETH_HDD_b_m6_i10_r2_I4096_c2_z64_S8_al-03
20150112_020344_conf_ETH_HDD_b_m6_i10_r2_I32768_c1_z128_S8_al-03
20150112_100104_conf_ETH_HDD_b_m6_i10_r1_I4096_c1_z128_S3_al-05
20150112_144609_conf_ETH_HDD_b_m8_i10_r1_I4096_c2_z64_S8_al-03
20150112_203804_conf_ETH_HDD_b_m6_i10_r1_I32768_c2_z64_S8_al-15
20150112_234041_conf_ETH_HDD_b_m6_i10_r1_I32768_c1_z64_S8_al-03
20150113_013529_conf_ETH_HDD_b_m6_i10_r1_I32768_c3_z64_S8_al-03
20150113_092326_conf_ETH_HDD_b_m10_i10_r1_I4096_c3_z64_S8_al-03
20150113_155457_conf_ETH_HDD_b_m2_i10_r1_I131072_c1_z256_S8_al-15
20150113_193430_conf_ETH_HDD_b_m8_i10_r2_I65536_c0_z32_S8_al-14
20150113_205147_conf_ETH_HDD_b_m8_i10_r2_I65536_c0_z256_S8_al-14
20150114_052042_conf_ETH_HDD_b_m6_i10_r2_I131072_c0_z64_S8_al-03
20150114_052459_conf_ETH_HDD_b_m8_i10_r2_I4096_c0_z128_S8_al-14
20150114_104950_conf_ETH_HDD_b_m8_i10_r2_I4096_c3_z32_S8_al-14
20150114_124608_conf_ETH_HDD_b_m10_i10_r2_I65536_c3_z64_S8_al-03
20150114_210629_conf_ETH_HDD_b_m4_i10_r2_I32768_c1_z128_S8_al-15
20150115_103238_conf_ETH_HDD_b_m4_i10_r2_I131072_c3_z64_S8_al-15
20150115_174847_conf_ETH_HDD_b_m6_i10_r2_I65536_c2_z256_S8_al-15
20150115_185703_conf_ETH_HDD_b_m6_i10_r2_I65536_c3_z32_S8_al-15
20150116_003009_conf_ETH_HDD_b_m6_i10_r2_I32768_c3_z32_S8_al-14
20150116_014130_conf_ETH_HDD_b_m6_i10_r2_I131072_c0_z64_S8_al-14
20150116_084302_conf_ETH_RL3_b_m4_i10_r1_I65536_c0_z64_S8_al-08
20150116_232735_conf_ETH_HDD_b_m8_i10_r2_I4096_c1_z32_S8_al-14
20150117_000020_conf_ETH_HDD_b_m8_i10_r2_I4096_c1_z128_S8_al-14
20150117_213609_conf_ETH_HDD_b_m6_i10_r2_I131072_c1_z32_S8_al-15
20150117_214416_conf_ETH_HDD_b_m10_i10_r1_I32768_c1_z256_S3_al-05
20150117_232235_conf_ETH_RL3_b_m2_i10_r1_I4096_c0_z64_S8_al-08
20150118_071538_conf_ETH_RL3_b_m2_i10_r1_I4096_c2_z64_S8_al-08
20150118_153319_conf_ETH_HDD_b_m10_i10_r2_I4096_c2_z64_S8_al-14
20150118_205125_conf_ETH_RL3_b_m2_i10_r1_I32768_c3_z32_S8_al-08
20150119_000444_conf_ETH_RL3_b_m2_i10_r1_I131072_c0_z64_S8_al-08
20150119_211159_conf_ETH_HDD_b_m8_i10_r3_I4096_c2_z64_S8_al-14
20150119_214826_conf_ETH_HDD_b_m4_i10_r3_I65536_c0_z64_S8_al-15
20150120_011018_conf_ETH_HDD_b_m8_i10_r3_I4096_c3_z64_S8_al-14
20150120_011111_conf_ETH_HDD_b_m4_i10_r3_I65536_c1_z256_S8_al-15
20150120_014628_conf_ETH_HDD_b_m8_i10_r3_I4096_c3_z128_S8_al-14
20150120_042537_conf_ETH_HDD_b_m8_i10_r3_I32768_c0_z256_S8_al-14
20150120_143023_conf_ETH_HDD_b_m8_i10_r3_I32768_c3_z32_S8_al-14
20141010_133757_conf_ETH_HDD_b_m8_i10_r1_I65536_c0_z64_rl-06
20141010_134136_conf_ETH_HDD_b_min_m8_i10_r1_I65536_c0_z64_rl-06
20150120_114252_conf_ETH_HD3_b_m16_i10_r1_I131072_c1_z256_S16_minerva100-02-18-22
20150121_133820_conf_ETH_HDD_b_m4_i10_r3_I131072_c2_z64_S8_al-15
20150121_214928_conf_ETH_RL3_b_m4_i10_r2_I65536_c1_z256_S8_al-08
20150122_032524_conf_ETH_HDD_b_m6_i10_r3_I4096_c2_z64_S8_al-14
20150122_181344_conf_ETH_HDD_b_m6_i10_r3_I131072_c1_z64_S8_al-14
20150122_195418_conf_ETH_RL3_b_m4_i10_r2_I32768_c2_z32_S8_al-08
20150122_215611_conf_ETH_HDD_b_m6_i10_r3_I131072_c3_z32_S8_al-14
20150123_040610_conf_ETH_HDD_b_m10_i10_r3_I65536_c1_z128_S8_al-14
20150123_112807_conf_ETH_HDD_b_m2_i10_r3_I65536_c0_z64_S8_al-15
20150123_153401_conf_ETH_RL3_b_m2_i10_r2_I65536_c1_z64_S8_al-08
20150123_155659_conf_ETH_HDD_b_m8_i10_r2_I131072_c2_z32_S3_al-05
20150123_214033_conf_ETH_HDD_b_m10_i10_r3_I32768_c0_z32_S8_al-14
20150123_221935_conf_ETH_RL3_b_m2_i10_r2_I65536_c3_z64_S8_al-08
20150123_234039_conf_ETH_HDD_b_m10_i10_r3_I32768_c1_z64_S8_al-14
20150124_154059_conf_ETH_HDD_b_m2_i10_r3_I32768_c1_z64_S8_al-15
20150124_213910_conf_ETH_RL3_b_m8_i10_r1_I65536_c2_z64_S8_al-14
20150125_000022_conf_ETH_RL3_b_m8_i10_r1_I65536_c3_z128_S8_al-14
20150125_073613_conf_ETH_RL3_b_m8_i10_r1_I4096_c3_z64_S8_al-14
20150125_075222_conf_ETH_HDD_b_m2_i10_r3_I131072_c2_z64_S8_al-15
20150125_161416_conf_ETH_RL3_b_m8_i10_r1_I32768_c3_z256_S8_al-14
20150125_171307_conf_ETH_HDD_b_m6_i10_r2_I32768_c0_z128_S3_al-05
20150125_234150_conf_ETH_RL3_b_m8_i10_r1_I131072_c3_z32_S8_al-14
20150126_014016_conf_ETH_RL3_b_m6_i10_r1_I65536_c0_z128_S8_al-14
20150126_143250_conf_ETH_RL3_b_m6_i10_r1_I4096_c3_z64_S8_al-14
20150126_195014_conf_ETH_RL3_b_m6_i10_r1_I32768_c1_z128_S8_al-14
20150126_233931_conf_ETH_RL3_b_m6_i10_r2_I65536_c1_z256_S8_al-08
20150127_004053_conf_ETH_RL3_b_m6_i10_r1_I131072_c0_z64_S8_al-14
20150127_033502_conf_ETH_RL3_b_m6_i10_r1_I131072_c1_z64_S8_al-14
20150127_083008_conf_ETH_RL3_b_m10_i10_r1_I65536_c0_z64_S8_al-14
20150127_102307_conf_ETH_RL3_b_m10_i10_r1_I65536_c1_z64_S8_al-14
20150127_191516_conf_ETH_RL3_b_m10_i10_r1_I4096_c1_z128_S8_al-14
20150127_225119_conf_ETH_RL3_b_m6_i10_r2_I32768_c1_z256_S8_al-08
20150128_145726_conf_ETH_RL3_b_m6_i10_r1_I131072_c0_z256_S8_al-15
20150128_165426_conf_ETH_RL3_b_m6_i10_r1_I131072_c1_z128_S8_al-15
20150128_173820_conf_ETH_RL3_b_m4_i10_r3_I65536_c0_z128_S8_al-08
20150128_211741_conf_ETH_RL3_b_m4_i10_r3_I65536_c1_z256_S8_al-08
20150128_225626_conf_ETH_RL3_b_m10_i10_r1_I32768_c1_z64_S8_al-14
20150129_010257_conf_ETH_RL3_b_m10_i10_r1_I32768_c2_z128_S8_al-14
20150129_043532_conf_ETH_RL3_b_m10_i10_r1_I131072_c0_z32_S8_al-14
20150129_055319_conf_ETH_RL3_b_m4_i10_r3_I4096_c0_z32_S8_al-08
20150129_074449_conf_ETH_HDD_b_m10_i10_r2_I32768_c2_z32_S3_al-05
20150204_212146_conf_ETH_RL3_b_m4_i10_r1_I131072_c2_z128_S8_al-08
20150205_161251_conf_ETH_HDD_b_m4_i10_r3_I4096_c1_z32_S8_al-15
20150205_215722_conf_ETH_RR1_b_m2_i10_r1_I4096_c2_z256_S8_rl-19
20150205_220636_conf_ETH_HDD_b_m8_i10_r1_I65536_c2_z32_S8_al-14
20150205_221333_conf_ETH_RR1_b_m2_i10_r1_I4096_c3_z64_S8_rl-19
20150206_053802_conf_ETH_HDD_b_m6_i10_r3_I32768_c1_z64_S8_al-15
20150206_170156_conf_ETH_HDD_b_m2_i10_r3_I4096_c3_z64_S8_al-15
20150206_173911_conf_ETH_HDD_b_m2_i10_r3_I32768_c0_z256_S8_al-15
20150207_082619_conf_ETH_RL3_b_m6_i10_r1_I32768_c0_z128_S8_al-15
20150208_104157_conf_ETH_RL3_b_m2_i10_r1_I32768_c2_z128_S8_al-15
20150208_151259_conf_ETH_RL3_b_m2_i10_r1_I131072_c0_z32_S8_al-15
20150208_163247_conf_ETH_RL3_b_m2_i10_r1_I131072_c0_z128_S8_al-15
20150209_052416_conf_ETH_RL3_b_m4_i10_r2_I65536_c1_z64_S8_al-15
20150209_110540_conf_ETH_RL3_b_m4_i10_r2_I65536_c3_z64_S8_al-15
20150209_234539_conf_ETH_RL3_b_m4_i10_r2_I32768_c0_z64_S8_al-15
20150210_202825_conf_ETH_HDD_b_m8_i10_r1_I32768_c3_z64_S8_al-14
20150219_072406_conf_ETH_RL3_b_m2_i12_r2_I65536_c0_z64_S8_al-28
20150222_103735_conf_ETH_HDD_b_m2_i10_r2_I65536_c0_z64_S8_al-28
20150223_185408_conf_ETH_RR3_b_m8_i10_r1_I65536_c0_z64_S8_rl-30
20150224_225226_conf_ETH_RR2_b_m2_i10_r2_I65536_c0_z64_S8_al-28
20150212_100115_conf_ETH_RL3_b_m4_i10_r3_I131072_c3_z32_S8_al-08
20150212_224815_conf_ETH_HDD_b_m8_i10_r1_I131072_c2_z256_S8_al-14
20150213_033953_conf_ETH_HDD_b_m8_i10_r1_I131072_c3_z64_S8_al-14
20150213_234516_conf_ETH_RL3_b_m2_i10_r3_I32768_c0_z32_S8_al-08
20150214_040155_conf_ETH_RL3_b_m6_i10_r1_I4096_c3_z64_S3_al-05
20150214_062236_conf_ETH_RL3_b_m2_i10_r2_I32768_c3_z64_S8_al-15
20150214_135726_conf_ETH_HDD_b_m6_i10_r1_I65536_c2_z64_S8_al-14
20150215_053142_conf_ETH_HDD_b_m6_i10_r1_I65536_c2_z256_S8_al-14
20150215_094315_conf_ETH_RL3_b_m6_i10_r1_I131072_c2_z128_S3_al-05
20150215_143624_conf_ETH_RL3_b_m4_i10_r3_I4096_c1_z32_S8_al-15
20150215_145546_conf_ETH_RL3_b_m6_i10_r3_I65536_c3_z32_S8_al-08
20150215_150046_conf_ETH_HDD_b_m6_i10_r1_I65536_c3_z32_S8_al-14
20150216_151053_conf_ETH_RL3_b_m6_i10_r3_I32768_c2_z64_S8_al-08
20150219_222847_conf_ETH_RL3_b_m7_i10_r2_I65536_c0_z64_S8_al-26
20150220_063059_conf_ETH_RL3_b_m5_i10_r2_I65536_c0_z64_S8_al-26
20150223_183300_conf_ETH_RR1_b_m4_i10_r2_I131072_c2_z64_S8_rl-19
20150224_094705_conf_ETH_RL3_b_m10_i10_r1_I65536_c0_z64_S8_al-26
20150226_091301_conf_ETH_RR3_b_m2_i11_r2_I65536_c0_z64_S8_al-28
20150226_235725_conf_ETH_RR3_b_m12_i10_r1_I65536_c0_z64_S8_al-26
20150227_011122_conf_ETH_RL3_b_m10_i10_r1_I65536_c0_z64_S8_al-26
20150227_073015_conf_ETH_RR3_b_m12_i10_r1_I65536_c0_z64_S8_al-26
20150228_080905_conf_ETH_HDD_b_m2_i10_r2_I65536_c0_z64_S8_al-28
20150228_090012_conf_ETH_RL3_b_m2_i12_r2_I65536_c0_z64_S8_al-28
20150228_114108_conf_ETH_HDD_b_m2_i11_r2_I65536_c0_z64_S8_al-28
20150306_131246_conf_ETH_RR1_b_m2_i10_r1_I65536_c0_z64_S8_al-28"


#$1 folder to look
find_folder() {

  #try fast locate first
  local found_folder="$(locate -l 1 -b $1)"

  #try slow find
  if [ ! "$found_folder" ] ; then
    local found_folder="$(find $SHARE_DIR -type d -name $1 -print -quit)"
  fi

  [ "$found_folder" ] && echo "$found_folder"
}

#main loop
logger "Starting..."

for jobs_folder in $failed_jobs ; do

  logger "INFO: iterating folder $jobs_folder"
  found="$(find_folder "$jobs_folder")"

  if [ "$found" ] ; then
    logger "INFO: found folder, copying to import dir $IMPORT_DIR"
     cp -ru "$found" "$IMPORT_DIR/"
  else
    logger "ERROR: could not find $jobs_folder"
  fi

done

