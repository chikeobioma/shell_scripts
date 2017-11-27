#!/bin/bash
serverlist=listofservers.txt
ACTION='hostname ; sudo -S <<< Amingo4god$ cat /etc/redhat-release'
while read hostname
do
	sshpass -f password.txt ssh -o "StrictHostKeyChecking no" $hostname $ACTION >> os.txt
done<"$serverlist"
