#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

BURIQ () {
    curl -sS https://raw.githubusercontent.com/bochil132/permission/main/ipmini > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f  /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f  /root/tmp
}
# https://repo.gabutzz-vpn.my.id/addon/protect 
MYIP=$(curl -sS ipv4.icanhazip.com)
ip=$(curl -s ipv4.icanhazip.com)
lstart=$(date -d "0 days" +"%Y-%m-%d")
lended=$(curl -sS https://raw.githubusercontent.com/bochil132/permission/main/ipmini | grep $ip | awk '{print $3}')
client=$(curl -sS https://raw.githubusercontent.com/bochil132/permission/main/ipmini | grep $ip | awk '{print $2}')
hariini=$(date -d "0 days" +"%Y-%m-%d")
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/bochil132/permission/main/ipmini | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}

clear
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
tyblue='\e[1;36m'
NC='\e[0m'
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
cd /root
#System version number
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi

localip=$(hostname -I | cut -d\  -f1)
hst=( `hostname` )
dart=$(cat /etc/hosts | grep -w `hostname` | awk '{print $2}')
if [[ "$hst" != "$dart" ]]; then
echo "$localip $(hostname)" >> /etc/hosts
fi

sleep 1
echo -e "${green}Script Has Ben Supported OS${NC} :"
echo -e "${red}1.${NC} Ubuntu 20.04"
echo -e "${red}2.${NC} Ubuntu 18.04"
echo -e "${red}3.${NC} Debian 10.04"
sleep 1

secs_to_human() {
    echo "Installation time : $(( ${1} / 3600 )) hours $(( (${1} / 60) % 60 )) minute's $(( ${1} % 60 )) seconds"
}
start=$(date +%s)
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
sysctl -w net.ipv6.conf.all.disable_ipv6=1 >/dev/null 2>&1
sysctl -w net.ipv6.conf.default.disable_ipv6=1 >/dev/null 2>&1

coreselect=''
cat> /root/.profile << END
# ~/.profile: executed by Bourne-compatible login shells.
if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi
mesg n || true
clear
END
chmod 644 /root/.profile
echo -e ""
echo -e "[ ${green}INFO${NC} ] Please Waitt...."
apt install git curl -y >/dev/null 2>&1
sleep 2
echo -e "[ ${green}INFO${NC} ] Good Installtion is ready"
sleep 2
echo -ne " Checking : "

PERMISSION
if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
green "Yes Your IP Registered"
sleep 3
else
red "IP No Registered Detected.!!"
rm runscript.sh > /dev/null 2>&1
sleep 10
exit 0
fi

export NC='\033[0m'
export multi='\E[41;1;39m'
export cyan='\033[0;36m'
export or='\033[1;33m'
export yl='\e[32;1m'
export rd='\e[31;1m'
export C='\033[0;36m'
export R='\e[31;1m'
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
tyblue='\e[1;36m'

clear
echo -e " [${cyan}✓${NC}] • ${or}License Validated To Your IP${NC}"
sleep 3
clear
echo -e "${or}License Start :${NC} ${lstart}"
sleep 1.5
echo -e "${or}License Ended :${NC} ${lended}"
sleep 1.5
echo -e "${or}Client Name   :${NC} ${client}"
sleep 1.5
echo -e "
${or}---------------------------------------------${NC}
  ${multi}Thanks You For Using AutoScript Installer${NC}
   ${cyan}This Script Base Official By ( Horass )${NC}
   ${cyan}Modded And Update By ( Sikecil_Waan :D )${NC}
${or}---------------------------------------------${NC}
"
mkdir -p /etc/bckp/
apt install git curl -y >/dev/null 2>&1
echo -e "Wait... Progress Installation..."
sleep 2

# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Link Hosting Kalian Untuk Ssh Vpn
ssh="stn-cloud.my.id/ssh"
# Link Hosting Kalian Untuk Xray
xray="stn-cloud.my.id/xray"
# Link Hosting Kalian Untuk Backup
backup="stn-cloud.my.id/backup"
# Link Hosting Kalian Untuk Websocket
ws="stn-cloud.my.id/python"
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$(wget -qO- ipinfo.io/ip);
clear
if [ -f "/etc/xray/domain" ]; then
echo "Script Already Installed"
exit 0
fi
mkdir /var/lib/fsidvpn;
clear
# // Starting Setup Domain

echo -e "----------------------------------------"
echo -e "${red}Indonesia Language${NC} ${green}:${NC}"
echo -e "${red}1.${NC} Menggunakan Domain Sendiri ${green}??${NC}"
echo -e "${red}2.${NC} Menggunakan Domain Otomatis ${green}??${NC}"
echo -e ""
echo -e "${red}English Language${NC} ${green}:${NC}"
echo -e "${red}1.${NC} Using Your Own Domain ${green}??${NC}"
echo -e "${red}2.${NC} Using Automated Domains ${green}??${NC}"
echo -e "----------------------------------------"
echo ""
read -p "$( echo -e "${tyblue}Select Options ? ${NC}(${red}1/2${NC})${NC} " )" choose_domain

# // Validating Automatic / Private
if [[ $choose_domain == "2" ]]; then # // Using Automatic Domain
    wget https://stn-cloud.my.id/menu/autopointing.sh && chmod +x autopointing.sh && ./autopointing.sh

# // ELif For Selection 1
elif [[ $choose_domain == "1" ]]; then

# // Clear
clear
clear && clear && clear
clear;clear;clear
echo -e "-----------------------------------------------------"
echo -e "${red}Indonesia language${NC} ${green}:${NC}"
echo -e "Silahkan Masukan Domain Yang Terhubung Ke IP VPS"
echo -e ""
echo -e "${red}English Language${NC} ${green}:${NC}"
echo -e "Please Enter The Domain Connected To The VPS IP"
echo -e "-----------------------------------------------------"
echo ""

# // Reading Your Input
read -p "Input Your Domain : " pp
if [[ $pp == "" ]]; then
    clear
    echo -e "No Input Detected !"
    exit 1
fi

# // Input Domain TO VPS
echo "$pp" > /root/domain
echo "$pp" > /etc/xray/domain
echo "IP=$pp" > /var/lib/fsidvpn/ipvps.conf

sleep 2
# // Success
echo -e ""
echo -e "Your Domain : $pp" 
sleep 2

# // Else Do
else
    echo -e "Please Choose 1 & 2 Only !"
    exit 1
fi
clear
#install v2ray
echo -e "${cyan}------------[${NC}${multi} Install Nginx ${NC}${cyan}]------------${NC}"
sleep 3
wget https://${xray}/ins-xray.sh >/dev/null 2>&1
chmod +x ins-xray.sh >/dev/null 2>&1
screen -S xray ./ins-xray.sh >/dev/null 2>&1
clear
#install ssh ovpn
echo -e "${cyan}------------[${multi} Install OpenVPN ${NC}${cyan}]------------${NC}"
sleep 3
wget https://${ssh}/ssh-vpn.sh >/dev/null 2>&1
chmod +x ssh-vpn.sh >/dev/null 2>&1
screen -S ssh-vpn ./ssh-vpn.sh >/dev/null 2>&1
#install autobackup
clear
echo -e "${cyan}------------[${NC}${multi} Install Set-BR ${NC}${cyan}]------------${NC}"
sleep 3
wget https://${backup}/set-br.sh >/dev/null 2>&1
chmod +x set-br.sh >/dev/null 2>&1
./set-br.sh >/dev/null 2>&1
# Websocket
clear
echo -e "${cyan}------------[${NC}${multi} Install SSH-WS ${NC}${cyan}]------------${NC}"
sleep 3
wget https://${ws}/edu.sh >/dev/null 2>&1
chmod +x edu.sh >/dev/null 2>&1
./edu.sh >/dev/null 2>&1
# Ohp Server
echo -e "${cyan}------------[${NC}${multi} Install OHP ${NC}${cyan}]------------${NC}"
sleep 3
wget https://${ssh}/ohp.sh >/dev/null 2>&1
chmod +x ohp.sh >/dev/null 2>&1
./ohp.sh >/dev/null 2>&1

rm -f /root/ssh-vpn.sh
rm -f /root/ins-xray.sh
rm -f /root/ipsec.sh
rm -f /root/set-br.sh
rm -f /root/edu.sh
rm -f /root/ohp.sh
rm -r -f domain
cat <<EOF> /etc/systemd/system/autosett.service
[Unit]
Description=autosetting
Documentation=https://t.me/WaanSuka_Turu

[Service]
Type=oneshot
ExecStart=/bin/bash /etc/set.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable autosett
echo -e "[ ${green}INFO$NC ] Installing Autoscript Completed.!!"
sleep 2
wget -O /etc/set.sh "https://${ssh}/set.sh" >/dev/null 2>&1
chmod +x /etc/set.sh >/dev/null 2>&1
history -c
cat> /root/.profile << END
# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n || true
clear
menu
END
chmod 644 /root/.profile

echo "1.2" > /home/ver
echo " "
echo "Installation has been completed!!"
echo " "
echo "=====================[ WELCOME TO MY SCRIPT LITE ]=====================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 990"  | tee -a log-install.txt
echo "   - Stunnel5                : 443, 445, 777"  | tee -a log-install.txt
echo "   - Dropbear                : 109, 143 , 443"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 89"  | tee -a log-install.txt
echo "   - Websocket TLS           : 443"  | tee -a log-install.txt
echo "   - Websocket HTTP          : 80"  | tee -a log-install.txt
echo "   - Websocket Ovpn          : 2086"  | tee -a log-install.txt
echo "   - XRAYS Vmess TLS         : 8443"  | tee -a log-install.txt
echo "   - XRAYS Vmess None TLS    : 8880"  | tee -a log-install.txt
echo "   - Trojan-Go               : 2087"  | tee -a log-install.txt
echo "   - OHP SSH                 : 8181"  | tee -a log-install.txt
echo "   - OHP Dropbear            : 8282"  | tee -a log-install.txt
echo "   - OHP OpenVPN             : 8383"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Auto Delete Expired Accounts"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Webmin Menu" | tee -a log-indtall.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 09.00 GMT +7" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   - Base Official Script      => Horas Marolop Amsal Siregar"  | tee -a log-install.txt
echo "   - Modded And Update         => Sikecil_Waan :D" | tee -a log-install.txt
echo "======================================================================" | tee -a log-install.txt
echo ""
echo "Please Wait To Process Reboot"
sleep 5
echo ""
rm -f runscript.sh
reboot
