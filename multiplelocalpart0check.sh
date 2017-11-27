#!/bin/bash
serverlist=listofservers.txt
ACTION='hostname ; sudo -S <<< Amingo4god$ /usr/local/sbin/cnvr-system-upgrade'
while read hostname
do
	sshpass -f password.txt ssh -n $hostname $ACTION >> localpart0.txt
done<"$serverlist"
