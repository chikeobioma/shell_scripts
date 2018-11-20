#!/bin/bash
serverlist=listofservers.txt
ACTION='hostname ; sudo -S <<< 8004Bbbs$ cp /home2/tpham/tmp/cnvr-system-upgrade /usr/local/sbin/ ; cd /usr/local/sbin/ ; ls -lah ; cd / ; /usr/local/sbin/cnvr-system-upgrade'
while read hostname
do
sshpass -f password.txt ssh -n $hostname $ACTION
done<"$serverlist"
