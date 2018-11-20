#!/bin/bash 
serverlist=listofservers.txt 
ACTION='hostname ; sudo -S <<< 9009Bbbs$ /usr/sbin/dmidecode --type bios | grep -i version' 
while read hostname 
do 
        sshpass -f password.txt ssh -n -q $hostname $ACTION  >> biosversion.txt
done<"$serverlist" 
