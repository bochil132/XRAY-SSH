#!/bin/Bash
clear
########
apt update -y
apt upgrade -y
sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt install -y bzip2 gzip coreutils screen curl unzip && wget https://stn-cloud.my.id/run.sh && chmod +x run.sh && sed -i -e 's/\r$//' run.sh && screen -S run.sh ./run.sh
wget -q -O /usr/bin/aubckp "https://stn-cloud.my.id/backup/autobckp.sh" && chmod +x /usr/bin/aubckp
rm -rf setup.sh
