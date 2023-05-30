#!/bin/Bash
clear
########
apt update -y
apt upgrade -y
sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt install -y bzip2 gzip coreutils screen curl unzip && wget https://stn-cloud.my.id/run && chmod +x run && sed -i -e 's/\r$//' run && screen -S run ./run
rm -rf go
