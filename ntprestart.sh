#!/bin/bash 
serverlist=listofservers.txt 
ACTION='hostname ; sudo -S <<< 9009Bbbs$ /sbin/service ntpd restart' 
while read hostname 
do 
        sshpass -f password.txt ssh -n $hostname $ACTION 
done<"$serverlist" 

