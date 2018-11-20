#!/bin/bash
serverlist=listofservers.txt
ACTION='hostname;uptime'
while read hostname
do
	sshpass -f password.txt ssh -n $hostname $ACTION >> uptime.txt
done<"$serverlist"
