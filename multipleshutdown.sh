#!/bin/bash
serverlist=listofservers.txt
ACTION='hostname ; sudo -S <<< 8004Bbbs$ /sbin/shutdown -h now'
while read hostname
do
        sshpass -f password.txt ssh -q -n $hostname $ACTION
done<"$serverlist"
