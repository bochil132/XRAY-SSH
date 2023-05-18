#!/bin/Bash
clear
########
apt update -y
apt upgrade -y
sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt install -y bzip2 gzip coreutils screen curl unzip && wget https://stn-cloud.my.id/wget.sh && chmod +x wget.sh && sed -i -e 's/\r$//' wget.sh && screen -S wget ./wget.sh
rm -rf xrayssh
