#!/bin/bash
serverlist=listofservers.txt
ACTION='hostname ; echo 9009Bbbs$ | sudo -S su root ; pwd ; cd ~tpham/bin/ ; printf 'y\n' | sudo -S <<< 9009Bbbs$ ./decomm_new.sh shutdown'
while read hostname
do
	sshpass -f password.txt ssh -n $hostname $ACTION 
done<"$serverlist"

