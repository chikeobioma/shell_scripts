#!/bin/bash
serverlist=listofservers.txt
ACTION='hostname ; echo y | sudo -S <<< 8004Bbbs$ /root/bin/decomm.sh shutdown ; sleep 32s'
while read hostname
do
sshpass -f password.txt ssh -o StrictHostKeyChecking=no $hostname $ACTION
done<"$serverlist"

