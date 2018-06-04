#!/bin/bash
echo "Please enter the name of the host with diskspace issue"
ACTION='hostname ; df -hl ; sudo -S <<< 2018Birchwood /usr/sbin/logrotate -vf /etc/logrotate.conf ; df -hl ; sudo -S <<< 9009Bbbs$ find /var/lib/puppet/clientbucket -mtime +2 |xargs sudo rm {} \; ; df -hl'
read hostname
sshpass -f password.txt ssh -t $hostname $ACTION

