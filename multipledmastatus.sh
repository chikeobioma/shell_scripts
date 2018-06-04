#!/bin/bash 
serverlist=listofservers.txt 
ACTION='hostname ; sudo -S <<< 9009Bbbs$ -iu dotomi dmactl status ; echo " "' 
while read hostname 
do 
        sshpass -f password.txt ssh -n -q $hostname $ACTION  >> dmastatus.txt 
done<"$serverlist" 

