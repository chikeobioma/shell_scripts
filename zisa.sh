#!/bin/bash
hostname=$(hostname)

var=$(sudo -iu dotomi zisactl pid <<< /home/chiobi/password.txt | awk '{print $4}') 
if [ "$var" == "not running" ]
then
             echo "Zisa is down and will be to restarted."
sudo -iu dotomi zisactl start <<< /home/chiobi/password.txt
sleep 20s
sudo -iu dotomi zisactl status <<< /home/chiobi/password.txt  
var=$(sudo -iu dotomi zisactl status  <<< /home/chiobi/password.txt | awk '{print $4}')  
if [ "$var" == "running" ] 
             then
                             echo "Zisa is running."
fi


