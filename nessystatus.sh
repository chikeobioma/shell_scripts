#!/bin/bash
var=$(nessyctl status | awk '{print $4}') 
if [ $var == "down" ]
then
	echo "Nessy app is down and will be restarted" 
scp sobioma@sobioma-vm.wl.vclk.net:/home/sobioma/password.txt ./
sudo -S -iu dotomi nessyctl stop < /home/sobioma/password.txt
sudo -S -iu dotomi nessyctl start < /home/sobioma/password.txt
sudo -S -iu dotomi nessyctl status < /home/sobioma/password.txt 
else
	echo "Nessy is up and running"
fi
