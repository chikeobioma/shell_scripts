#!/bin/bash
serverlist=listofservers.txt
ACTION='hostname ; sudo -S <<< 9009Bbbs$ /usr/sbin/cnvr-patch preview ; sudo -S <<< 9009Bbbs$ /usr/sbin/cnvr-patch update'
while read hostname
do
	sshpass -f password.txt ssh -q -n $hostname $ACTION
done<"$serverlist"
