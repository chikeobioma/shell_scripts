#!/usr/bin/expect -f
spawn ssh dtord01hfl0301p.dc.dotomi.net
expect "sobioma:"
send "Amingo4god$\r"
expect "$ "
send "sudo /root/bin/decomm.sh reboot\r"
expect "sobioma:"
send "Amingo4god$\r"
expect "Are you sure? (y/n):"
send "y\r"
expect "$ "
send "exit\r"
