#!/bin/bash
clear

wget http://stn-cloud.my.id/xray/Core-TrojanWs
wget http://stn-cloud.my.id/xray/Core-Xray
mv /root/Core-TrojanWs /usr/local/bin/trojan-go
mv /root/Core-Xray /usr/local/bin/xray
chmod +x /usr/local/bin/trojan-go
chmod +x /usr/local/bin/xray
systemctl restart trojan-go.service
systemctl restart xray.service
clear
echo "Vps akan reboot sebentar"
