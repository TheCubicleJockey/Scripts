#!/bin/bash
cd /tmp
rm -f jenkins.war.backup
cp /usr/lib/jenkins/jenkins.war /tmp/jenkins.war.backup
rm -f jenkins.war
wget http://mirrors.jenkins-ci.org/war/latest/jenkins.war
cp /tmp/jenkins.war /usr/lib/jenkins/jenkins.war
wait
java -jar /var/cache/jenkins/war/WEB-INF/jenkins-cli.jar -s https://Your.JenkinsSite.com/ safe-restart
#nohup /home/centos/scripts/copywar.sh > /tmp/copywar.out 2>&1 &
