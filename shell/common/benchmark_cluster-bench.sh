# Benchmark to gather cluster basics

[ ! "$BENCH_LIST" ] && BENCH_LIST="hardinfo hdparm dd"

BENCH_REQUIRED_PACKAGES="$BENCH_REQUIRED_PACKAGES hdparm coreutils hardinfo"

# Set bench global variables here (if any)

# Some validations
[ "$noSudo" ] && { logger "ERROR: SUDO not available, not running $bench_name."; return 0; }

benchmark_suite_config() {
  BENCH_DEVICE_MOUNTS="$(get_device_mounts)"

  [ ! "$BENCH_DEVICE_MOUNTS" ] && logger "ERROR: cannot get list of devices and mount points.";
}

benchmark_hdparm(){
  local bench_name="${FUNCNAME[0]##*benchmark_}"
  logger "INFO: Running $bench_name"

  local devices="$(get_devices)"
  [ ! "$devices" ] && { logger "ERROR: cannot get list of devices"; return 0; }

  for device in $devices ; do
    logger "INFO: Running $bench_name on device: $device"
    execute_all "$bench_name" "sudo hdparm --direct -tT $device" "time"
  done
}

benchmark_hardinfo(){
  local bench_name="${FUNCNAME[0]##*benchmark_}"
  logger "INFO: Running $bench_name"

  execute_all "$bench_name" "hardinfo -r -f text > $(get_local_bench_path)/hardinfo-full-\$(hostname).txt" "time"
}

benchmark_dd(){
  local bench_name="${FUNCNAME[0]##*benchmark_}"
  logger "INFO: Running $bench_name"

  local mounts="$(get_mounts)"
  [ ! "$mounts" ] && { logger "ERROR: cannot get list of mount points."; return 0; }

  local parts="$(( BENCH_DATA_SIZE / 1000000 ))"
  local tmp_file

  for mount in $mounts "/dev/shm" ; do
    logger "INFO: Running $bench_name on mount: $mount file size: $BENCH_DATA_SIZE parts: $parts"
    [ "$mount" == "/" ] && tmp_file="${mount}dd_test.tmp" || tmp_file="$mount/dd_test.tmp"

    # For the last, the mem device only 1GB test
        [[ "$mount" = "/dev/shm" && "$parts" > "1000" ]] && parts="1000"

    # Note: the direct flag doesn't work on all disk types ie., /dev/shm. That is why we add two read commands
    # Note: the write part, the nocache seems to work fine, but not always on the read that is why we use direct too.
    execute_all "$bench_name" "\
echo 'WRITE_DIRECT:';  sudo dd if=/dev/zero of=$tmp_file bs=1M count=$parts conv=fdatasync,notrunc oflag=direct;
echo 'WRITE_NOCACHE:'; sudo dd if=/dev/zero of=$tmp_file bs=1M count=$parts conv=fdatasync,notrunc oflag=nocache;
echo 'READ_DIRECT:';   sudo dd if=$tmp_file of=/dev/null bs=1M conv=nocreat iflag=direct,sync oflag=nocache;
echo 'READ_NOCACHE:';  sudo dd if=$tmp_file of=/dev/null bs=1M conv=nocreat iflag=nocache,sync oflag=nocache;
[ -f $tmp_file ] && sudo rm -f $tmp_file" "time"
  done
}