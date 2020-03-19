#!/bin/bash
export PATH=$PATH:/mnt/c/Windows/System32
nslookup.exe github.com 2> /dev/null | grep "Address:" | head -1 | sed 's/.*: /nameserver/g' > resolv.conf
ipconfig.exe -all  | grep "Primary Dns Suffix" | sed 's/.*: /search /g' >> resolv.conf
if [ $EUID != 0 ]; then
	sudo "$0" "$@"
	exit $?
fi
tr -d '\015' < resolv.conf > /etc/resolv.conf
rm resolv.conf
chown root:root /etc/resolv.conf
chmod 644 /etc/resolv.conf
