#!/bin/bash
# Use $HOSTNAME when script is running on local server
serverlist=listofservers.txt
ACTION='hostname ; scp sobioma@sobioma-vm.wl.vclk.net:/home/sobioma/password.txt ./ ; sudo -S -iu dotomi biddyctl status < /home/sobioma/password.txt'
while read hostname
do
	sshpass -f password.txt ssh -n -q $hostname $ACTION 
done<"$serverlist"
