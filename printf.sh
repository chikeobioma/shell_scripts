#!/bin/bash
date=$(date +"%m-%d-%Y")
time=$(date +"%H:%M:%S")
printf -v x "Name:\t%s\nDate:\t%s\nTime:\t%s\n" "$USER" $date $time
echo "$x"
