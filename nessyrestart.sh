#!/bin/bash
# Use $HOSTNAME when script is running on local server
serverlist=listofservers.txt
ACTION='hostname'
while read hostname
do
	sshpass -f password.txt ssh -n $hostname $ACTION 
done<"$serverlist"
