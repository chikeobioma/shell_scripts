#!/bin/bash
serverlist=listofservers.txt
ACTION='hostname ; sudo -S <<< 9009Bbbs$ -s ; cd ~tpham/bin ; ls -lah | grep decomm_new.sh ; echo " "'
while read hostname
do
	sshpass -f password.txt ssh -n $hostname $ACTION >> decommavail.txt
done<"$serverlist"
