#!/bin/sh
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/opt/dell/srvadmin/bin
PATH=$PATH:/opt/dell/srvadmin/sbin:/opt/dell/toolkit/bin
PATH=$PATH:/usr/local/bin:/usr/local/sbin:/root/bin:.

case "$1" in
        shutdown|reboot)
                ;;
        *)
                echo "Usage: $0 [shutdown|reboot]"
                exit 1
                ;;
esac

echo This script will wipe out the boot sector, DNS and remove host from foreman,
echo set DRAC to DHCP and reboot/shutdown
echo " "
echo -n "Are you sure? (y/n): "
read yorn

if [ "x${yorn}" != "xy" ]; then
        echo Exiting script
        exit 0
fi

MAKE=$(dmidecode -s system-manufacturer)
MODEL=$(dmidecode -s system-product-name)
SERIAL=$(dmidecode -s system-serial-number)
HOSTNAME=$(/bin/hostname)
FOREMAN_URL='http://foreman101.ord.cnvr.net/api/v2'

echo Serial Number: $SERIAL
if [ "x$MAKE" = "xDell Inc." ]; then
        echo Setting Dell specific items:
        t=0
        syscfg lcp --ipaddrsrc=dhcp
        t=$(($?+i))
        syscfg lcp --nicselection=dedicated
        t=$(($?+i))
        syscfg lcp --autoneg=enable
        t=$(($?+i))
        syscfg lcp --dnsdhcp=enable
        t=$(($?+i))
        syscfg lcp --dnsracname=idrac-${SERIAL}
        t=$(($?+i))
        syscfg lcp --dnsregisterrac=enable
        t=$(($?+i))
        syscfg lcp --domainnamednsdhcp=enable
        t=$(($?+i))

        if [ $t -ne 0 ]; then
                echo Setting DRAC to DHCP failed... 
        fi
fi

echo Removing ${HOSTNAME}from foreman
sleep 2
curl -H 'Accept:application/json' \
     -k -u admin:changeme -X DELETE \
     ${FOREMAN_URL}/hosts/${HOSTNAME} 

echo
echo Saving sda boot sector and wiping
dd if=/dev/sda of=/root/sda.bs bs=446 count=1
dd if=/dev/zero of=/dev/sda bs=446 count=1

echo In case root is sdm as on R720xds with an H310 mini RAID
echo Saving sdm boot sector and wiping
dd if=/dev/sdm of=/root/sdm.bs bs=446 count=1
dd if=/dev/zero of=/dev/sdm bs=446 count=1

echo Setting BMC to use DHCP
ipmitool lan set 1 ipsrc dhcp

echo Setting BMC password to default
ipmitool user set password 2 'jat#1Slu'

if [ "$1" = "shutdown" ]; then
        shutdown -h now
elif [ "$1" = "reboot" ]; then
        reboot
fi
