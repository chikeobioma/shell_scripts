#!/bin/bash
status () {
echo $?
}
ls fakefile >> /dev/null 2>&1
status
touch realfile.txt
status
