serverlist=listofservers.txt 
ACTION='hostname ; /sbin/service snmpd status ; /sbin/service snmpd restart ; /sbin/service snmpd status; echo " "'
while read hostname 
do 
        sshpass -f password.txt ssh -n -q $hostname $ACTION   
done<"$serverlist" 

