#!/bin/bash
var=$(sasquatchctl status | awk '{print $4}') 
if [ $var == "down" ]
then
	echo "Sasquatch app is down and will be restarted" 
scp sobioma@sobioma-vm.wl.vclk.net:/home/sobioma/password.txt ./
sudo -S -iu dotomi sasquatchctl stop < /home/sobioma/password.txt
sudo -S -iu dotomi sasquatchctl start < /home/sobioma/password.txt
sudo -S -iu dotomi sasquatchctl status < /home/sobioma/password.txt 
else
	echo "Sasquatch is up and running"
fi
