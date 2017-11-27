#!/bin/bash
serverlist=listofservers.txt
ACTION='hostname ; cd / ; sudo -S <<< 8004Bbbs$ puppet agent -tov'
while read hostname
do
	sshpass -f password.txt ssh -n -q $hostname $ACTION
done<"$serverlist"
