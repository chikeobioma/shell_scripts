#!/bin/bash
serverlist=listofservers.txt
ACTION='hostname ; cd /localpart0 ; pwd'
while read hostname
do
	sshpass -f password.txt ssh -n -q $hostname $ACTION
done<"$serverlist"
