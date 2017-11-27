#!/bin/bash
echo "Please enter your age."
read AGE
if [ $AGE -le 20 ] || [ $AGE -ge 50 ] ; then
echo "Sorry, the are not in the right age group for this party."
elif [ $AGE -gt 20 ] && [ $AGE -lt 30 ] ; then 
echo "You are old enough to party with us"
elif [ $AGE -ge 30 ] && [ $AGE -lt 40 ] ; then
echo "You are in you 30s"
else
echo "You are in your 40s"
fi 
