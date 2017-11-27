#!/bin/bash
hostname=$(hostname)

var=$(sudo -iu dotomi zisactl pid < /home/nosmonaliev/passwd.txt | awk '{print $4}') 
if [ "$var" == "not running" ]
then
             echo "Zisa is down and will be to restarted."
sudo -iu dotomi zisactl start < /home/nosmonaliev/passwd.txt 
sleep 20s
sudo -iu dotomi zisactl status < /home/nosmonaliev/passwd.txt  
var=$(sudo -iu dotomi zisactl status  < /home/nosmonaliev/passwd.txt | awk '{print $4}')  
if [ "$var" == "running" ] 
             then
                             echo "Zisa is running."
fi


