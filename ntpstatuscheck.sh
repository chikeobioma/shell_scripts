#!/bin/bash 
serverlist=listofservers.txt 
ACTION='hostname ; sudo -S <<< 9009Bbbs$ /sbin/service ntpd status ; echo " "' 
while read hostname 
do 
        sshpass -f password.txt ssh -n -q $hostname $ACTION >> ntpstatus.txt
done<"$serverlist" 
