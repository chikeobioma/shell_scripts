#!/bin/bash
serverlist=listofservers.txt
ACTION='hostname ; sudo -S <<< 8004Bbbs$ facter -p | grep has_cnvr'
while read hostname
do
	sshpass -f password.txt ssh -n $hostname $ACTION >> ipa.txt
done<"$serverlist"

