#!/bin/bash
IP=( List all IPs to BLock)
for i in $IP
do
  aws ec2 associate-vpc-cidr-block --vpc-id vpc-BlockedDestination --cidr-block $i
  wait
  sleep 10
done
