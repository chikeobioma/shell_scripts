#!/bin/bash
for hostname in `cat /home/chiobi/listofservers.txt`; do
    sshpass -f password.txt ssh-copy-id -i ~/.ssh/id_rsa.pub $hostname
done
