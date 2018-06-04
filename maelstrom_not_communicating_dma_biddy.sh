#!/bin/bash
hostname=$(hostname)
scp sobioma@sobioma-vm.wl.vclk.net:/home/sobioma/password.txt ./
var=$(sudo -S -iu dotomi maelstromctl status  < /home/sobioma/password.txt | awk '{print $4}') 
if [ "$var" == "running" ]
then
	echo "Maelstrom is up and running." 
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
	else
mail -s "Maelstrom is down in ${hostname}" "sobioma@conversantmedia.com" <<< "/opt/dotomi/logs/maelstrom/maelstrom.log and /opt/dotomi/maelstrom/maelstrom.console needs to be checked for errors. If there are errors that can be resolved, we need to resolve it. If nnot, we have to create a NOC ticket, send and email to cnvr_maelstrom_alerting@conversantmedia.com and call the Maelstrom on-call engineer."
	fi
fi

