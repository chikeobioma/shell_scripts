#!/bin/bash
hostname=$(hostname)
scp sobioma@sobioma-vm.wl.vclk.net:/home/sobioma/password.txt ./
var=$(sudo -S -iu dotomi maelstromctl status  < /home/sobioma/password.txt | awk '{print $4}') 
if [ "$var" == "running" ]
then
	echo "Maelstrom is up and running." 
	mail -s "Maelstrom is up and running in ${hostname} but it's sending a false alarm. " "noc@conversantmedia.com" <<< "Create a NOC ticket and escalate to the monitoring team. -NOC"
	exit
else
	echo "Maelstrom is down and will be restarted."
sudo -S -iu dotomi maelstromctl start < /home/sobioma/password.txt 
sleep 30s
sudo -S -iu dotomi maelstromctl status < /home/sobioma/password.txt  
var=$(sudo -S -iu dotomi maelstromctl status  < /home/sobioma/password.txt | awk '{print $4}')  
if [ "$var" == "running" ] 
	then
		echo "Maelstrom is now up and running."
		mail -s "Maelstrom was restarted in ${hostname}" "CNVR_Maelstrom_Alerting@conversantmedia.com" <<< "An alert was received that Maelstom was down in ${hostname}. It has automatically been restarted and is now running and ready. -NOC"
	else
		mail -s "Maelstrom is down in ${hostname}" "noc@conversantmedia.com" <<< "/opt/dotomi/logs/maelstrom/maelstrom.log and /opt/dotomi/maelstrom/maelstrom.console needs to be checked for errors. If there are errors that can be resolved, we need to resolve it. If not, we have to create a NOC ticket, send and email to cnvr_maelstrom_alerting@conversantmedia.com and call the Maelstrom on-call engineer. -NOC"
	fi
fi
