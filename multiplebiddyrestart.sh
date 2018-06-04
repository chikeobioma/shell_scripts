#!/bin/bash
serverlist=listofservers.txt
ACTION='hostname ; sudo -S <<< 9009Bbbs$ -iu dotomi biddyctl status ; sudo -S <<< 9009Bbbs$ -iu dotomi biddyctl stopf; sleep 7s ; sudo -S <<< 9009Bbbs$ -iu dotomi biddyctl status ; sudo -S <<< 9009Bbbs$ -iu dotomi biddyctl start ; sleep 10s ; sudo -S <<< 9009Bbbs$ -iu dotomi biddyctl status ; echo " "'
while read hostname
do
	sshpass -f password.txt ssh -n -q $hostname $ACTION 
done<"$serverlist"
