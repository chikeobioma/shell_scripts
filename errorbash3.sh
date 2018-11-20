#!/bin/bash
flashred=$(tput setab 0; tput setaf 1; tput bold)
red=$(tput setab 0; tput setaf 1)
none=$(tput sgr0)
echo -e $flashred"Error: "$none$red"Something is not right."$none
