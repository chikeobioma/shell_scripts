#!/bin/bash
file=$1
if [ -e $file ]
then
echo -e "$file exists"
else
echo -e "$file doesn't exist"
fi
