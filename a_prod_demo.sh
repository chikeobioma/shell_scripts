#!/bin/bash

serverlist=listofservers.txt
ACTION='hostname ; uptime'

while read hostname
do

sshpass -f password.txt ssh -o StrictHostKeyChecking=no $hostname
sshpass -f password.txt ssh -n -q $hostname $ACTION

done<"$serverlist"
