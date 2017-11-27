#!/bin/bash 
serverlist=listofservers.txt 
ACTION='racadm set system.thermalsettings.FanSpeedOffset 1' 
while read hostname 
do 
        sshpass -f password1.txt ssh -n -q root@$hostname $ACTION  >> fan.txt
done<"$serverlist" 

