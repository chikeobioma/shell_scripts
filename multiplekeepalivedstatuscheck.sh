#!/bin/bash
serverlist=listofservers.txt
ACTION='hostname ; sudo -S <<< 9009Bbbs$ /sbin/service keepalived status ; echo " " ; echo " "'
while read hostname
do
	sshpass -f password.txt ssh -q -n $hostname $ACTION >> keepalived.txt
done<"$serverlist"

