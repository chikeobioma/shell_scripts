#!/bin/bash
hostname=$(hostname)
var=$(/sbin/service snmpd status | awk '{print $5}') 

if [ "$var" == "running..." ]
then
	echo "snmpd is running. No action is needed" 
	exit
else
	echo "snmpd is not running. It will be restarted now."
	sudo -S <<< 9009Bbbs$ /sbin/service snmpd restart
fi

sleep 1m

var=$(/sbin/service snmpd status | awk '{print $5}')

if [ "$var" == "running..." ]
then
	echo "snmpd is running. No action is needed"
	exit
