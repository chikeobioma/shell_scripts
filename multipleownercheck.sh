#!/bin/bash
serverlist=listofservers.txt 
ACTION='hostname ; ls -lah /hadoop/disk1/ | grep -i kafka; echo " "' 
while read hostname 
do 
        sshpass -f password.txt ssh -n -q $hostname $ACTION >> chown.txt
done<"$serverlist" 
