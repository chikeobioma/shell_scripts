#!/bin/bash
hostname=$(hostname)
var=$(/sbin/service ntpd status | awk '{print $5}') 

if [ "$var" == "running..." ]
then
	echo "ntpd is running. No action is needed" 
	exit
else
	echo "ntpd is not running. It will be restarted now."
	sudo -S <<< 9009Bbbs$ /sbin/service ntpd restart
fi

sleep 1m

var=$(/sbin/service ntpd status | awk '{print $5}')

if [ "$var" == "running..." ]
then
	echo "ntpd is running. No action is needed"
	exit
