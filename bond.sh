#!/bin/bash
serverlist=listofservers.txt
ACTION='hostname'
while read hostname
do
	sshpass -f password.txt ssh -n $hostname $ACTION >> status.txt
done<"$serverlist"
