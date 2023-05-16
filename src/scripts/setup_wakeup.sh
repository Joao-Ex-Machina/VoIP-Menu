#!/bin/bash
hours="$1"
minutes="$2"
CALLERID="$3"
current_time=$(date +%H%M)
wake_time="${hours}${minutes}"
if [[ $current_time -ge $wake_time ]]; then
    touch -t $(date -d "$(date +%Y%m%d) ${hours}:${minutes} +1 day" +%Y%m%d%H%M) /var/spool/asterisk/tmp/${CALLERID}_${hours}:${minutes}.call
else
    touch -t $(date -d "$(date +%Y%m%d) ${hours}:${minutes}" +%Y%m%d%H%M) /var/spool/asterisk/tmp/${CALLERID}_${hours}:${minutes}.call
fi

