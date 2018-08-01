#!/bin/bash
b=("Stephen" "Chike" "Obioma")
echo "My middle name is "${b[1]}
b[3]="King C"
b+=("Treasure")
echo ${b[@]}
echo "My first stage name was "${b[@]: -1}
