#!/bin/bash
read num
if [ $num -eq 100 ]
then 
echo "$num is equal to 100"
elif [ $num -gt 100 ]
then
echo "$num is greater than 100"
else 
echo "$num is less than 100"
fi

