#!/bin/bash 
echo "What is the name of the host with issues?" 
read hostname
ssh -n -q $hostname  hostname 
