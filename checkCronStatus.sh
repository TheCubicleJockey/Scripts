#!/bin/sh
server=( IpAddress Array )
ipaddy=$(curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/    <.*$    //')
#List alloud IP addresses
if [[ "$ipaddy" == 72.49.132.82*  ||  "$ipaddy" == 24.221.226.174*  ||  "$ipaddy" == 96.73.60.69* ]] > /dev/null ; then
for i in "${server[@]}" ; do
if ssh -qn root@$i  -o IdentityFile='KeyFileHERE' "service crond status | grep running" > /dev/null ;  then
        #echo "yes"
        :
else
        ssh -qn root@$i  -o IdentityFile='KeyFileHERE' "service crond start"
        curl -X POST --data-urlencode 'payload={"channel": "#cm-tech", "nicholas.haven": "webhookbot", "text": "Cron was turned on for '$i'", "icon_emoji": ":coursemill:"}' https://hooks.slack.com/Slackhoock
fi
        wait
done
fi

