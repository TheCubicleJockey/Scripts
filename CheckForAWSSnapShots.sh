#!/bin/bash
vid=( vol-List all volumen IDs here )
aws ec2 describe-snapshots --owner-ids AWSACCOUNTID > /tmp/snapshot2.txt
wait
for i in "${vid[@]}" ; do
  grep -B2  $i /tmp/snapshot2.txt > /tmp/parse2.txt
  if grep $(date +'%Y-%m-%d') /tmp/parse2.txt > /dev/null ;  then
    #echo "yes today $i"
    :
  else
    #echo "not today $i"
    if grep $(date --date='1 day ago' +'%Y-%m-%d') /tmp/parse2.txt > /dev/null ;  then
      #echo "yes yesterday $i"
      :
    else
      curl -X POST --data-urlencode 'payload={"channel": "#cm-tech", "nicholas.haven": "webhookbot", "text": "Check backups for '$i'", "icon_emoji": ":coursemill:"}' https://hooks.slack.com/sevice/SLACK/HOOK
      wait
      #echo "no yesterday or today $i"
    fi
    :
  fi
done
