#!/bin/bash
serverlist=listofservers.txt
while read hostname
do
	sshpass -f password.txt ssh -q $hostname ; hostname ; df -hl
done<"$serverlist"

