#!/bin/bash 
serverlist=listofservers.txt 
ACTION='racadm get system.thermalsettings.FanSpeedOffset' 
while read hostname 
do 
        sshpass -f password1.txt ssh -n -q root@$hostname $ACTION  >> fanstatus.txt
done<"$serverlist" 

