#!/bin/bash
serverlist=listofservers.txt
ACTION='hostname ; /sbin/service snmpd status'
while read hostname
do
sshpass -f password.txt ssh -n $hostname $ACTION
done<"$serverlist"
