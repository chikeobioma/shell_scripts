#!/bin/bash
serverlist=listofservers.txt
while read hostname
do
	sshpass -f password.txt ssh -o StrictHostKeyChecking=no -o PasswordAuthentication=no $hostname
done<"$serverlist"
