#!/bin/bash
IP=NewIPaddressToBeAddedToSecurityGroups
OLDIP=OldIPaddressToBeRemoved
CIDR=32
SG=(sg-ToBeEffected sg-array )
SG6=(sg-ToBeEffected sg-Secondaryaccount )
for i in "${SG[@]}" ; do
  aws ec2 authorize-security-group-ingress --group-id $i --ip-permissions IpProtocol=tcp,FromPort=0,ToPort=65535,IpRanges='[{CidrIp= '$IP'/'$CIDR',Description="Nick Haven"}]'
  sleep 10
  aws ec2 revoke-security-group-ingress --group-id $i --ip-permissions IpProtocol=tcp,FromPort=0,ToPort=65535,IpRanges='[{CidrIp= '$OLDIP'/'$CIDR'}]'
  sleep 10
done
for i in "${SG6[@]}" ; do
  aws ec2 authorize-security-group-ingress --profile PROFILENAME --group-id $i --ip-permissions IpProtocol=tcp,FromPort=0,ToPort=65535,IpRanges='[{CidrIp= '$IP'/'$CIDR',Description="Nick Haven"}]'
  sleep 10
  aws ec2 revoke-security-group-ingress --profile PROFILENAME --group-id $i --ip-permissions IpProtocol=tcp,FromPort=0,ToPort=65535,IpRanges='[{CidrIp= '$OLDIP'/'$CIDR'}]'
  sleep 10
done
