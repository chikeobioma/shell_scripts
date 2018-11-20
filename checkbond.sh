#!/bin/bash
serverlist=listofservers.txt
ACTION='hostname ; ifconfig -a'
while read hostname
do
	sshpass -f password.txt ssh -n $hostname $ACTION >> bondcheck.txt
done<"$serverlist"
