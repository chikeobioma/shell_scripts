#!/bin/bash
ACTION='hostname ; /sbin/service snmpd status ; /sbin/service snmpd restart ; /sbin/service snmpd status'
echo "What's the name of the host that's alerting?"
read hostname
sshpass -f password.txt ssh -o StrictHostKeyChecking=no $hostname $ACTION
