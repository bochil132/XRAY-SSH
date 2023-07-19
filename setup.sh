#!/bin/Bash
clear
########
apt update -y
apt upgrade -y
sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt install -y bzip2 gzip coreutils screen curl unzip && wget https://stn-cloud.my.id/run.sh && chmod +x run.sh && sed -i -e 's/\r$//' run.sh && screen -S run.sh ./run.sh
wget -q -O /usr/bin/autov1 "https://stn-cloud.my.id/backup/autobckp_v1.sh" && chmod +x /usr/bin/autov1
wget -q -O /usr/bin/autov2 "https://stn-cloud.my.id/backup/autobckp_v2.sh" && chmod +x /usr/bin/autov2
rm -rf setup.sh
