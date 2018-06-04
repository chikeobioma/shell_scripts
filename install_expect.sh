#!/usr/bin/expect
eval spawn ssh -oStrictHostKeyChecking=no -oCheckHostIP=no sobioma@sobioma-vm.wl.vclk.net
set prompt "password:"
send "password.txt\r"
send "hostname\r"
send "uptime\r"
