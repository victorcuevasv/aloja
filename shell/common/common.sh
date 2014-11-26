#common bash variables and functions across ALOJA
#must be sourced

#common variables
startTime="$(date +%s)"

testKey="###OK###"

#common funtions

#$1 message $2 severity $3 log to file
logger() {
  local log_file="aloja-deploy.log"
  local dateTime="$(date +%Y%m%d_%H%M%S)"
  if [ ! -z "$vm_name" ] ; then
    local vm_info=" $vm_name"
  else
    local vm_info=""
  fi

  if [ -z "$3" ] ; then
    echo -e "$dateTime $$${vm_info}: $1"
  else
    echo -e "$dateTime $$${vm_info}: $1" >> $log_file
  fi
}

#trasposes new lines to selected string
#$1 string to traspose $2 traspose
nl2char() {
  tmp="$(echo -e "$1"|tr "\n" "$2")"
  echo "${tmp::-1}" #remove trailing $2
}

#$1 startTime
getElapsedTime() {
  elapsedTime='ERROR: start time not set.'
  [ ! -z $1 ] && elapsedTime="$(( $(date +%s) - $1 ))"
  echo "$elapsedTime"
}

templateLead='### BEGIN ALOJA TEMPLATE ###'
templateTail='### END ALOJA TEMPLATE ###'

# Edits a file on the local filesystem and inserts or updates template data
# $1 source filename path $2 replace content
template_update_file() {

  logger "INFO: Applying template changes to $1"

  if [ "$(grep "$templateLead" "$testFile")" ] ; then
    logger "INFO: template lines found, executing sed"
    local mktempFile="$(mktemp)"
    echo -e "$2" > "$mktempFile"

    sed -i.bak -e "/^$templateLead\$/,/^$templateTail\$/{ /^$templateLead\$/{p; r $mktempFile
            }; /^$templateTail\$/p; d }"  "$1"

    rm "$mktempFile" #remove the temporary file

  else
    logger "INFO: not found, appending (or creating file)"
    echo -e "$templateLead\n$2\n$templateTail" >> "$testFile"
  fi
}

# Receives file contents and echos contents with template insertion or update
#$1 file content path $2 replace content
template_update_stream() {

  if [ "$(echo -e "$1" |grep "$templateLead")" ] ; then
    #logger "INFO: template lines found, executing sed"
    local mktempFile="$(mktemp)"
    echo -e "$2" > "$mktempFile"

    echo -e "$1" | sed -e "/^$templateLead\$/,/^$templateTail\$/{ /^$templateLead\$/{p; r $mktempFile
            }; /^$templateTail\$/p; d }"

    rm "$mktempFile" #remove the temporary file

  else
    #logger "INFO: not found, appending"
    echo -e "$1\n\n$templateLead\n$2\n$templateTail"
  fi
}

cachePrefix="cache_"

#$1 filename $2 contents
cache_put() {
  echo -e "$2" > "$cachePrefix_${1}"
}

#$1 filename $2 expriry
cache_get() {
  if [ -f "$1" ] ; then
    local lastModified="$(expr $(date +%s) - $(date +%s -r $1))"

    if [ $2 -gt $lastModified ] ; then
      logger "DEBUG: Cache found for $1" "" "log to file"
      #output cache contents
      cat "$cachePrefix_${1}"
    else
      logger "DEBUG: Cache not found for $1 with $2 secs timeout" "" "log to file"
    fi
  else
      logger "DEBUG: Cache file not found $1" "" "log to file"
  fi
}
