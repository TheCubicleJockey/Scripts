#!/bin/sh
server=( IPAddress Array )
for i in "${server[@]}" ; do
        if
        ssh -qn root@$i -o IdentityFile='KeyFileHERE' "service tomcat8 status | grep running" > /dev/null ; then
        :
else
        ssh -qn root@$i -o IdentityFile='KeyFileHERE' "service tomcat8 start"

        :
fi
        wait
done

