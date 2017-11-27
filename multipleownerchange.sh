#!/bin/bash
serverlist=listofservers.txt 
ACTION='hostname ; sudo -S <<< 9009Bbbs$ chown -R vchadoop:vchadoop /hadoop/disk1/kafka/ ; ls -lah /hadoop/disk1/ | grep -i kafka; ls -lah /hadoop/disk1/kafka | grep -i data ; echo " "' 
while read hostname 
do 
        sshpass -f password.txt ssh -n -q $hostname $ACTION >> chown.txt
done<"$serverlist" 
