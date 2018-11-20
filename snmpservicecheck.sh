#!/bin/bash
hostname=$(hostname)
var=$(/bin/systemctl status  snmpd.service | grep Active | awk '{print $3}') 

if [ $var == "(running)" ]
then
	echo "snmpd is running. No action is needed" 
	exit
else
	echo "snmpd is not running. It will be restarted now."
	scp sobioma@sobioma-vm.wl.vclk.net:/home/sobioma/password.txt ./
	sudo -S /sbin/service snmpd restart < /home/sobioma/password.txt
fi

var=$(/bin/systemctl status  snmpd.service | grep Active | awk '{print $3}') 

if [ $var == "(running)" ]
then
	echo "snmpd is running. No action is needed"
	exit
else
	string=$(snmpget localhost -v2c -c someonesnotmonitoringproperly .1.3.6.1.2.1.1.1.0 | awk '{print $5}')
fi

if [ "$string" == $hostname ]
then
	echo "System is configured properly but something is still not functioning right. Alert will be forwarded to cnvr.sysadmin via email."
	mail -s "Snmp is down in ${hostname}" "sobioma@conversantmedia.com" <<< "System is configured properly but something is still not functioning right."
	exit
else
	echo "System is not configured properly or service has stopped"
	sudo -S /sbin/service snmpd status < /home/sobioma/password.txt
fi

if [ "$var" == "(running)" ] 
then
	echo "snmpd is running. No action is needed"
	exit
else
	echo "snmpd is still not running."
fi


if [ "$string" == $hostname ]
then
	echo "System is configured properly but something is still not functioning right. Alert will be forwarded to cnvr.sysadmin via Iris."
	mail -s "Snmp is down in ${hostname}" "sobioma@conversantmedia.com" <<< "System is configured properly but something is still not functioning right."
	exit
else
	echo "System is not configured properly. Alert will be forwarded to cnvr.sysadmin via Iris."
	mail -s "Snmp is down in ${hostname}" "sobioma@conversantmedia.com" <<< "System is not configured properly."
fi
