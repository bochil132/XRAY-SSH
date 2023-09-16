#!/bin/bash

#install
apt update && apt upgrade
apt install python3 python3-pip git
git clone https://github.com/bochil132/XRAY-SSH.git
unzip XRAY-SSH/xolpanel.zip
pip3 install -r xolpanel/requirements.txt

#isi data
echo ""
read -e -p "[*] Input your Bot Token : " bottoken
read -e -p "[*] Input Your Id Telegram :" admin
read -e -p "[*] Input Your Domain :" domain
echo -e BOT_TOKEN='"'$bottoken'"' > /root/xolpanel/var.txt
echo -e ADMIN='"'$admin'"' >> /root/xolpanel/var.txt
echo -e DOMAIN='"'$domain'"' >> /root/xolpanel/var.txt
clear
echo "Done"
echo "Your Data Bot"
echo -e "==============================="
echo "DOMAIN         : $bottoken"
echo "Email          : $admin"
echo "Api Key        : $domain"
echo -e "==============================="
echo "Setting done"

cat > /etc/systemd/system/xolpanel.service << END
[Unit]
Description=Simple XolPanel - @XolPanel
After=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/python3 -m xolpanel
Restart=always

[Install]
WantedBy=multi-user.target
END

systemctl start xolpanel 
systemctl enable xolpanel
rm -rf XRAY-SSH
cd
clear
#Create Ssh
cp /root/xolpanel/ssh/addssh.sh /usr/bin/addssh ; chmod +x /usr/bin/addssh
cp /root/xolpanel/ssh/cekssh.sh /usr/bin/cekssh ; chmod +x /usr/bin/cekssh
cp /root/xolpanel/ssh/delssh.sh /usr/bin/delssh ; chmod +x /usr/bin/delssh
cp /root/xolpanel/ssh/list.sh /usr/bin/listssh ; chmod +x /usr/bin/listssh
cp /root/xolpanel/ssh/addssh.sh /usr/bin/addssh ; chmod +x /usr/bin/addssh

#Create Vmess
cp /root/xolpanel/vmess/addws.sh /usr/bin/addws ; chmod +x /usr/bin/addws
cp /root/xolpanel/vmess/delws.sh /usr/bin/delws ; chmod +x /usr/bin/delws
cp /root/xolpanel/vmess/trialws.sh /usr/bin/trialws ; chmod +x /usr/bin/trialws
cp /root/xolpanel/vmess/list.sh /usr/bin/listws ; chmod +x /usr/bin/listws
cp /root/xolpanel/vmess/renewws.sh /usr/bin/renewws ; chmod +x /usr/bin/renewws

#Create Trojan
cp /root/xolpanel/trojan/addtr.sh /usr/bin/addtr ; chmod +x /usr/bin/addtr
cp /root/xolpanel/trojan/deltr.sh /usr/bin/deltr ; chmod +x /usr/bin/deltr
cp /root/xolpanel/trojan/renewtr.sh /usr/bin/renewtr ; chmod +x /usr/bin/renewtr
cp /root/xolpanel/trojan/list.sh /usr/bin/listtr ; chmod +x /usr/bin/listtr

#other menu
cp /root/xolpanel/trojan/backup.sh /usr/bin/backupbot ; chmod +x /usr/bin/backupbot
cp /root/xolpanel/trojan/restore.sh /usr/bin/restorebot ; chmod +x /usr/bin/restorebot
cp /root/xolpanel/trojan/syssinfo.sg /usr/bin/systeminfo ; chmod +x /usr/bin/systeminfo
cp /root/xolpanel/trojan/infoaja.sh /usr/bin/infobot ; chmod +x /usr/bin/infobot
cp /root/xolpanel/trojan/infoservice.sh /usr/bin/infoservice ; chmod +x /usr/bin/infoservice
systemctl restart xolpanel
clear
echo " Installations complete, type /menu on your bot"
