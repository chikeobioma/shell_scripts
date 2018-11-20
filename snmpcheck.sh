#!/bin/bash
echo "What's the name of the host that's alerting?"
read hostname
sshpass -f password.txt ssh -n $hostname sudo -S <<< 8004Bbbs$ /sbin/service snmpd status ; sudo -S <<< 8004Bbbs$ /sbin/service snmpd restart ;  sudo -S <<< 8004Bbbs$ /sbin/service snmpd status
