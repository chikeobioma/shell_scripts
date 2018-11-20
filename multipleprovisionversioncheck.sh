#!/bin/bash
serverlist=listofservers.txt
ACTION='hostname ; sudo -S <<< 9009Bbbs$ facter -p provisioning_version ; echo " "'
while read hostname
do
	sshpass -f password.txt ssh -n -q $hostname $ACTION  >> prov.txt
done<"$serverlist"


