#!/bin/bash
set -x

var=$(dmactl status | awk '{print $5}')

echo $var

if [ $var == down ]
then
   echo "this dma is Down"
else
   echo "This dma is up"
fi

