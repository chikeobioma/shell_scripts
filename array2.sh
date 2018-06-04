#!/bin/bash
declare -A myarray
myarray[color]=Red
myarray["inside color"]="Light Blue"
echo ${myarray[color]} is ${myarray["inside color"]}
