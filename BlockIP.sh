#!/bin/bash
#blocks ip addresses in iptables
LOGFILE="/home/tomcat/scripts/logs/BlockIP.log"
echo "What IP adrress would you like to block?"
read IP
iptables -A INPUT -s $IP -j DROP
