#!/bin/bash
sshpass -f password.txt ssh -o StrictHostKeyChecking=no chiobi@se1psxitss001.gameop.net
sshpass -f password.txt ssh -n -q chiobi@se1psxitss001.gameop.net
