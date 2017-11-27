#!/bin/bash
hostname=$(hostname)

var=$(sudo -iu dotomi workbenchctl pid < /home/nosmonaliev/passwd.txt | awk '{print $4}') 
if [ "$var" == "not running" ]
then
              echo "Workbench is down and attemting to restart."
sudo -iu dotomi workbenchctl start < /home/nosmonaliev/passwd.txt 
sleep 20s
sudo -iu dotomi workbenchctl status < /home/nosmonaliev/passwd.txt  
var=$(sudo -iu dotomi workbenchctl status  < /home/nosmonaliev/passwd.txt | awk '{print $4}')  
if [ "$var" == "running" ] 
              then
                              echo "Workbench is running."
fi 


