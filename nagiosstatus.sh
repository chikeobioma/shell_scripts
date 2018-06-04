#!/bin/bash
ACTION='hostname ; uptime ; nagios=$(/etc/rc.d/init.d/nagios status | awk '{print $5}')'
echo "What is the name of the host with issues?"
read hostname
ping -c1 $hostname &>/dev/null
if [ $? -eq 0 ]
then
	echo "Host is responding to ping. We will now attempt to ssh into the host."
	sshpass -f password.txt ssh -n -q $hostname $ACTION
	if [ "$nagios" == "running..." ]
	then
		echo "Nagios is already running. No further action is needed."
		exit
	else 
		etc/rc.d/init.d/nagios start
	fi
else
	echo "This host is not responding to ping."
	echo "We will send a notification email to the server owners now."
	mail -s "$hostname is not responding" "sobioma@conversantmedia.com" <<<  $(echo -e "The NOC has attempted to login to this host but we've been unsuccessful. Can someone please take a look?. \n Thank you.")
fi
