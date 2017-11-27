#!/bin/bash
serverlist=listofservers.txt
ACTION='hostname ; sudo -S <<< 8004Bbbs$ /sbin/service snmpd status ; sudo -S <<< 8004Bbbs$ /sbin/service snmpd restart ;  sudo -S <<< 8004Bbbs$ /sbin/service snmpd status'
while read hostname
do
	sshpass -f password.txt ssh -n $hostname $ACTION >> snmp.txt
done<"$serverlist"

