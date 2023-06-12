#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`

#color code
export NC='\033[0m'
export multi='\E[43;1;39m'
export semua='\E[45;1;39m'
export new='\E[45;1;39m'
export cyan='\033[0;36m'
export or='\033[1;33m'
export yl='\e[32;1m'
export rd='\e[31;1m'
export C='\033[0;36m'
export R='\e[31;1m'
export G="\033[0;32m"
export B='\033[0;34m'
export O='\033[0;33m'

function status(){
#########################
# GETTING OS INFORMATION
source /etc/os-release
Versi_OS=$VERSION
ver=$VERSION_ID
Tipe=$NAME
URL_SUPPORT=$HOME_URL
basedong=$ID

CITY=$( curl -s ipinfo.io/city )

# CHEK STATUS 
openvpn_service="$(systemctl show openvpn.service --no-page)"
oovpn=$(echo "${openvpn_service}" | grep 'ActiveState=' | cut -f2 -d=)
tls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nontls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
trojan_server=$(systemctl status trojan-go | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
dropbear_status=$(/etc/init.d/dropbear status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
stunnel_service=$(/etc/init.d/stunnel5 status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
squid_service=$(/etc/init.d/squid status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
ssh_service=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vnstat_service=$(/etc/init.d/vnstat status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
cron_service=$(/etc/init.d/cron status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
fail2ban_service=$(/etc/init.d/fail2ban status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
wstls=$(systemctl status ws-tls | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
wsdrop=$(systemctl status ws-nontls | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
shd=$(systemctl status sshd | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
udp=$(systemctl status rc-local | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
wsovpn=$(systemctl status ws-ovpn | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
cron=$(systemctl status cron | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
sqd=$(systemctl status squid | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nginx=$(systemctl status nginx | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
osslh=$(systemctl status sslh | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
udpsts=$(systemctl status udp-custom | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)

# COLOR VALIDATION
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
green='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
c='\033[0;36m'
LIGHT='\033[0;37m'
clear

# STATUS SERVICE  SSH 
if [[ $ssh_service == "running" ]]; then 
   status_ssh="${GREEN}ON ( Running )${NC}"
else
   status_ssh="${RED}OFF ( Error )${NC}"
fi

# STATUS SERVICE  VNSTAT 
if [[ $vnstat_service == "running" ]]; then 
   status_vnstat="${GREEN}ON ( Running )${NC}"
else
   status_vnstat="${RED}OFF ( Error )${NC}"
fi

# STATUS SERVICE  FAIL2BAN 
if [[ $fail2ban_service == "running" ]]; then 
   status_fail2ban="${GREEN}ON ( Running )${NC}"
else
   status_fail2ban="${RED}OFF ( Error )${NC}"
fi

# STATUS SERVICE  TLS 
if [[ $tls_v2ray_status == "running" ]]; then 
   v2ray_tls="${GREEN}ON ( Running )${NC}"
else
   v2ray_tls="${RED}OFF ( Error )${NC}"
fi

# STATUS SERVICE NON TLS V2RAY
if [[ $nontls_v2ray_status == "running" ]]; then 
   v2ray_ntls="${GREEN}ON ( Running )${NC}"
else
   v2ray_ntls="${RED}OFF ( Error )${NC}"
fi

# Status Service Trojan GO
if [[ $strgo == "active" ]]; then
  status_trg="${GREEN}ON ( Running )${NC}"
else
  status_trg="${RED}OFF ( Error )${NC}"
fi

# STATUS SERVICE L2TP
if [[ $trojan_server == "running" ]]; then 
   status_trgo="${GREEN}ON ( Running )${NC}"
else
   status_trgo="${RED}OFF ( Error )${NC}"
fi

# STATUS SERVICE DROPBEAR
if [[ $dropbear_status == "running" ]]; then 
   status_beruangjatuh="${GREEN}ON ( Running )${NC}"
else
   status_beruangjatuh="${RED}OFF ( Error )${NC}"
fi

# STATUS SERVICE STUNNEL
if [[ $stunnel_service == "running" ]]; then 
   status_stunnel="${GREEN}ON ( Running )${NC}"
else
   status_stunnel="${RED}OFF ( Error )${NC}"
fi

# STATUS SERVICE WEBSOCKET TLS
if [[ $wstls == "running" ]]; then 
   swstls="${GREEN}ON ( Running )${NC}"
else
   swstls="${RED}OFF ( Error )${NC}"
fi

# STATUS SERVICE WEBSOCKET DROPBEAR
if [[ $wsdrop == "running" ]]; then 
   swsdrop="${GREEN}ON ( Running )${NC}"
else
   swsdrop="${RED}OFF ( Error )${NC}"
fi

# STATUS SERVICE WEBSOCKET OPEN OVPN
if [[ $wsovpn == "running" ]]; then 
   swsovpn="${GREEN}ON ( Running )${NC}"
else
   swsovpn="${RED}OFF ( Error )${NC}"
fi

# STATUS SERVICE SSLH / SSH
if [[ $osslh == "running" ]]; then 
   sosslh="${GREEN}ON ( Running )${NC}"
else
   sosslh="${RED}OFF ( Error )${NC}"
fi

# STATUS OHP DROPBEAR
if [[ $ohp == "running" ]]; then 
   sohp="${GREEN}ON ( Running )${NC}"
else
   sohp="${RED}OFF ( Error )${NC}"
fi

# STATUS OHP OpenVPN
if [[ $ohq == "running" ]]; then 
   sohq="${GREEN}ON ( Running )${NC}"
else
   sohq="${RED}OFF ( Error )${NC}"
fi

# STATUS OHP SSH
if [[ $ohr == "running" ]]; then 
   sohr="${GREEN}ON ( Running )${NC}"
else
   sohr="${RED}OFF ( Error )${NC}"
fi

# STATUS SERVICE WEBSOCKET OPENSSH
if [[ $wsopen == "running" ]]; then 
   swsopen="${GREEN}ON ( Running )${NC}" 
else
   swsopen="${RED}OFF ( Error )${NC}"
fi

# STATUS SERVICE SSHD
if [[ $shd == "running" ]]; then 
   shdd="${GREEN}ON ( Running )${NC}" 
else
   shdd="${RED}OFF ( Error )${NC}"
fi

# STATUS SERVICE BADVPN
if [[ $udp == "running" ]]; then 
   udpw="${GREEN}ON ( Running )${NC}" 
else
   udpw="${RED}OFF ( Error )${NC}"
fi

# STATUS SERVICE CRON
if [[ $cron == "running" ]]; then 
   cr="${GREEN}ON ( Running )${NC}" 
else
   cr="${RED}OFF ( Error )${NC}"
fi

# STATUS SERVICE SQUID
if [[ $sqd == "running" ]]; then 
   sq="${GREEN}ON ( Running )${NC}" 
else
   sq="${RED}OFF ( Error )${NC}"
fi

# STATUS SERVICE NGINX
if [[ $nginx == "running" ]]; then 
   nx="${GREEN}ON ( Running )${NC}" 
else
   nx="${RED}OFF ( Error )${NC}"
fi
clear

# STATUS UDP CUSTOM
if [[ ${udpsts} == "running" ]]; then
   udp="${GREEN}ON ( Running )${NC}"
else
   udp="${RED}OFF ( Error )${NC}"
fi

echo -e ""
clear
loadcpu=$(printf '%-0.00001s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
up="$(uptime -p | cut -d " " -f 2-10)"
cpu=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
core=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
ct=$(curl -s ipinfo.io/city )
sp=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
IPVPS=$(curl -s ipinfo.io/ip )
DOMAIN=$(cat /etc/xray/domain)
echo -e ""
echo -e " ${ORANGE}DOMAIN      = $DOMAIN"
echo -e " IP VPS      = $IPVPS"
echo -e " ISP VPS     = $sp"
echo -e " CITY VPS    = $ct"
echo -e " LOAD CPU    = $loadcpu %"
echo -e " OS NAME     = "`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`
echo -e " CORE VPS    = $core Core"
echo -e " UPTIME      = $up"
echo -e " CPU MODEL   =$cpu"
echo -e " RAM         = $tram MB / Usage $uram MB"
echo -e " STORAGE     = $(df -h / | awk '{print $2}' | tail -n1 | sed 's/G//g' | sed 's/ //g') GB" " / Usage $(df -h / | awk '{print $3}' | tail -n1 | sed 's/G//g' | sed 's/ //g') GB${NC}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${multi}                ${rd}Status All Service                  ${NC}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e " ${green}•${NC} NGINX                        = $nx"
echo -e " ${green}•${NC} SSH / TUN                    = $status_ssh"
echo -e " ${green}•${NC} OVPN WS                      = $swsovpn"
echo -e " ${green}•${NC} DROPBEAR                     = $status_beruangjatuh"
echo -e " ${green}•${NC} VNSTAT                       = $status_vnstat"
echo -e " ${green}•${NC} SSH WS TLS                   = $swstls"
echo -e " ${green}•${NC} SSH WS NONE TLS              = $swsdrop"
echo -e " ${green}•${NC} VMESS TLS                    = $v2ray_tls"
echo -e " ${green}•${NC} VMESS NONE TLS               = $v2ray_ntls"
echo -e " ${green}•${NC} TROJAN GO TLS                = $status_trgo"
echo -e " ${green}•${NC} STUNNEL                      = $status_stunnel"
echo -e " ${green}•${NC} SSLH                         = $sosslh"
echo -e " ${green}•${NC} FAIL2BAN                     = $status_fail2ban"
echo -e " ${green}•${NC} SSHD                         = $shdd"
echo -e " ${green}•${NC} BADVPN UDPGW                 = $udpw"
echo -e " ${green}•${NC} CRONTAB                      = $cr"
echo -e " ${green}•${NC} SQUID PROXY                  = $sq"
echo -e " ${green}•${NC} SSH UDP                      = ${udp}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Home-Menu"
menu
}

function update(){
clear
echo -e "
=================================================
     ${multi}Progress Update AutoScript XRAY-SSH${NC}
================================================="
sleep 1
wget -q -O /usr/bin/cf-pointing "https://stn-cloud.my.id/menu/cloudflare-pointing.sh" && chmod +x /usr/bin/cf-pointing
wget -q -O /usr/bin/cf-setting "https://stn-cloud.my.id/menu/cloudflare-setting.sh" && chmod +x /usr/bin/cf-setting
wget -q -O /usr/bin/menu "https://stn-cloud.my.id/menu/menu.sh" && chmod +x /usr/bin/menu
wget -q -O /usr/bin/menu-ssh "https://stn-cloud.my.id/menu/function-ssh.sh" && chmod +x /usr/bin/menu-ssh
wget -q -O /usr/bin/menu-vmess "https://stn-cloud.my.id/menu/function-vmess.sh" && chmod +x /usr/bin/menu-vmess
wget -q -O /usr/bin/menu-trgo "https://stn-cloud.my.id/menu/function-trgo.sh" && chmod +x /usr/bin/menu-trgo
wget -q -O /usr/bin/license "https://stn-cloud.my.id/menu/license.sh" && chmod +x /usr/bin/license
wget -q -O /usr/bin/backup "https://stn-cloud.my.id/backup/gdrive.sh" && chmod +x /usr/bin/backup
wget -q -O /usr/bin/bkp "https://stn-cloud.my.id/backup/autobackup.sh" && chmod +x /usr/bin/bkp
wget -q -O /usr/bin/info "https://stn-cloud.my.id/ssh/info.sh" && chmod +x /usr/bin/info
wget -q -O /usr/bin/exp "https://stn-cloud.my.id/ssh/autoremove.sh" && chmod +x /usr/bin/exp
wget -q -O /usr/bin/wbmn "https://stn-cloud.my.id/ssh/webmin.sh" && chmod +x /usr/bin/wbmn
sleep 2
echo -e "${or}Update AutoScript XRAY-SSH Succesfuly${NC}"
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Home-Menu"
menu
}

function about(){
clear
echo -e "================================================="
echo -e "#        AutoScript Installer XRAY-SSH          #"
echo -e "================================================="
echo -e "# For Debian 10 64 bit                          #"
echo -e "# For Ubuntu 18.04 & Ubuntu 20.04 64 bit        #"
echo -e "# For VPS with KVM and VMWare virtualization    #"
echo -e "# Modded And Update By Sikecil_Waan :D          #"
echo -e "================================================="
echo -e "# Thanks To                                     #"
echo -e "================================================="
echo -e "# Allah SWT                                     #"
echo -e "# My Family                                     #"
echo -e "# Horasss                                       #"
echo -e "================================================="
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Home-Menu"
menu
}

function changesub(){
clear
MYIP=$(wget -qO- ipinfo.io/ip);
clear
read -rp "Input New Domain : " -e domain
echo "$domain" > /var/lib/fsidvpn/ipvps.conf
rm -rf /etc/xray/domain
echo "$domain" >/etc/xray/domain
echo -e "[ ${yl}INFO${NC} ] Start " 
sleep 0.5
systemctl stop ws-nontls
systemctl stop nginx
domain=$(cat /var/lib/fsidvpn/ipvps.conf | cut -d'=' -f2)
Cek=$(lsof -i:80 | cut -d' ' -f1 | awk 'NR==2 {print $1}')
if [[ ! -z "$Cek" ]]; then
sleep 1
echo -e "[ ${rd}WARNING${NC} ] Detected port 80 used by $Cek " 
systemctl stop $Cek
sleep 2
echo -e "[ ${yl}INFO${NC} ] Processing to stop $Cek " 
sleep 1
fi
echo -e "[ ${yl}INFO${NC} ] Starting renew cert... " 
sleep 2
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
/root/.acme.sh/acme.sh --issue -d $domain --force --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
echo -e "[ ${yl}INFO${NC} ] Renew cert done... " 
sleep 2
echo -e "[ ${yl}INFO${NC} ] Starting service $Cek " 
sleep 2
echo "$domain" >/etc/xray/domain
systemctl restart $Cek
systemctl restart nginx
echo -e "[ ${yl}INFO${NC} ] All finished... " 
sleep 0.5
clear
echo -e ""
echo -e "Starting Restart All Service"
sleep 2
systemctl restart ws-tls
systemctl restart ws-nontls
systemctl restart xray
systemctl restart ws-ovpn
/etc/init.d/ssh restart
/etc/init.d/dropbear restart
/etc/init.d/sslh restart
/etc/init.d/stunnel5 restart
/etc/init.d/openvpn restart
/etc/init.d/fail2ban restart
/etc/init.d/cron restart
/etc/init.d/nginx restart
/etc/init.d/squid restart
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 1000
echo -e "Restart All Service Berhasil"
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Home-Menu"
menu
}

function certscript(){
clear
echo -e "${rd}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$nc"
echo -e "${yl}               • RENEW DOMAIN SSL •               $nc"
echo -e "${rd}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$nc"
echo -e ""
echo -e "[ ${yl}INFO${NC} ] Start " 
sleep 0.5
systemctl stop ws-nontls
systemctl stop nginx
domain=$(cat /var/lib/fsidvpn/ipvps.conf | cut -d'=' -f2)
Cek=$(lsof -i:80 | cut -d' ' -f1 | awk 'NR==2 {print $1}')
if [[ ! -z "$Cek" ]]; then
sleep 1
echo -e "[ ${rd}WARNING${NC} ] Detected port 80 used by $Cek " 
systemctl stop $Cek
sleep 2
echo -e "[ ${yl}INFO${NC} ] Processing to stop $Cek " 
sleep 1
fi
echo -e "[ ${yl}INFO${NC} ] Starting renew cert... " 
sleep 2
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
/root/.acme.sh/acme.sh --issue -d $domain --force --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
echo -e "[ ${yl}INFO${NC} ] Renew cert done... " 
sleep 2
echo -e "[ ${yl}INFO${NC} ] Starting service $Cek " 
sleep 2
echo "$domain" > /etc/xray/domain
systemctl restart $Cek
systemctl restart nginx
echo -e "[ ${yl}INFO${NC} ] All finished... " 
sleep 0.5
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Home-Menu"
menu
}

function restart(){
clear
echo -e ""
echo -e "Starting Restart All Service"
sleep 2
systemctl restart ws-tls
systemctl restart ws-nontls
systemctl restart xray
systemctl restart ws-ovpn
/etc/init.d/ssh restart
/etc/init.d/dropbear restart
/etc/init.d/sslh restart
/etc/init.d/stunnel5 restart
/etc/init.d/openvpn restart
/etc/init.d/fail2ban restart
/etc/init.d/cron restart
/etc/init.d/nginx restart
/etc/init.d/squid restart
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 1000
echo -e "Restart All Service Succesfully"
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Home-Menu"
menu
}

function xol(){
clear
echo -e "${O}============================================${NC}"
echo -e "  ${G}Bot XolPanel SSH Only${NC}"
echo -e "  ${rd}1.${NC} Created Ssh By Bot"
echo -e "  ${rd}2.${NC} Delete Ssh By Bot"
echo -e "  ${rd}3.${NC} Trial Ssh By Bot"
echo -e "  ${rd}4.${NC} And Other Feature..."
echo -e "${O}============================================${NC}"
echo -e "  ${yl}Credit By : @xolv4${NC}"
echo -e ""
read -p "Yakin ingin menginstall ?? (y/n) : " opt
echo -e ""
case $opt in
y | Y)
wget http://stn-cloud.my.id/install_bot.sh && chmod +x install_bot.sh && ./install_bot.sh && rm -rf install_bot.sh
;;
n | N)
menu
;;
esac
}

clear
day=$(date "+%A")
jam=$(date "+%T")
script_info=$(curl -sS https://raw.githubusercontent.com/bochil132/permission/main/script-update)
totalram=$(free -m | awk 'NR==2 {print $2}')
usageram=$(free -m | awk 'NR==2 {print $3}')
ip=$(curl -sS ipv4.icanhazip.com)
expscript=$(curl -sS https://raw.githubusercontent.com/bochil132/permission/main/ipmini | grep $ip | awk '{print $3}')
d2=$(date -d "$biji" +"+%s")
d1=$(date -d "$expscript" +"+%s")
dayleft=$(( ($d1 - $d2) / 86400 ))
client=$(curl -sS https://raw.githubusercontent.com/bochil132/permission/main/ipmini | grep $ip | awk '{print $2}')
datainfo=$(date)
upusage="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
tousage="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
downusage="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
trojanws=$(grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 2-3 | column -t | sort | uniq | wc -l)
sshws="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
vmess=$(grep -E "^### " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq | wc -l)
echo -e "
  ${C}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}
 ${C}│${NC}         ${yl}Hi, Wellcome To AutoScript SSH & Xray Only${NC}         ${C}│${NC}
 ${C}│${NC}            ${yl}Thanks You For Using This AutoScript${NC}            ${C}│${NC}
 ${C}│${NC}                  ${rd}Script credit by @Horass${NC}                  ${C}│${NC}
  ${C}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}
   ${O}Tanggal : ${biji}   Waktu : ${jam}   Hari : ${day}${NC}
  ${C}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}
                 ${C}┌───────────────────────────┐${NC}
                 ${C}│${NC}${new} ☟☟ FOR MENU AUTOSCRIPT ☟☟ ${NC}${C}│${NC}
                 ${C}└───────────────────────────┘${NC}
  ${C}┌───────────────────────────────────────────────────────────┐${NC}
  ${C}│${NC}     ${rd}1.)${NC} ${O}MENU SSH-WS${NC}            ${rd}9.)${NC} ${O}ADMIN REGIS IP${NC}         ${C}│${NC}
  ${C}│${NC}     ${rd}2.)${NC} ${O}MENU VMESS-WS${NC}         ${rd}10.)${NC} ${O}ABOUT SCRIPT${NC}           ${C}│${NC}
  ${C}│${NC}     ${rd}3.)${NC} ${O}MENU TROJAN-WS${NC}        ${rd}11.)${NC} ${O}RESTART SERVICE${NC}        ${C}│${NC}
  ${C}│${NC}     ${rd}4.)${NC} ${O}BACKUP & RESTORE${NC}      ${rd}12.)${NC} ${O}REBOOT SYSTEM${NC}          ${C}│${NC}
  ${C}│${NC}     ${rd}5.)${NC} ${O}RUNNING SERVICE${NC}       ${rd}13.)${NC} ${O}INSTALL WEBMIN${NC}         ${C}│${NC}
  ${C}│${NC}     ${rd}6.)${NC} ${O}CHANGE DOMAIN${NC}         ${rd}14.)${NC} ${O}CLOUDFLARE DNS${NC}         ${C}│${NC}
  ${C}│${NC}     ${rd}7.)${NC} ${O}UPDATE SCRIPT${NC}         ${rd}15.)${NC} ${O}PORT INFO${NC}              ${C}│${NC}
  ${C}│${NC}     ${rd}8.)${NC} ${O}RENEW CERT SSL${NC}        ${rd}16.)${NC} ${O}INSTALL BOT${NC}            ${C}│${NC}
  ${C}└───────────────────────────────────────────────────────────┘${NC}
  ${C}┌─────────────────────────────────────┐${NC}
  ${C}│${NC}   ${O}• Client Script Info •${NC}
  ${C}│${NC}   ${yl}Client Name  :${NC} $client
  ${C}│${NC}   ${yl}Expired Tggl :${NC} $expscript
  ${C}│${NC}   ${yl}Sisa Aktif   :${NC} $dayleft Days
  ${C}│${NC}
  ${C}│${NC}   ${O}• Accounts Info •${NC}
  ${C}│${NC}   ${yl}SSH-WS      :${NC} $sshws
  ${C}│${NC}   ${yl}TROJAN-WS   :${NC} $trojanws
  ${C}│${NC}   ${yl}VMESS-WS    :${NC} $vmess
  ${C}└─────────────────────────────────────┘${NC}"
echo -e "
${yl}${script_info}${NC}
"
echo ""
read -p " Select Number Of Menu (1-16) : " opt
echo -e ""
case $opt in
1) clear ; menu-ssh;;
2) clear ; menu-vmess;;
3) clear ; menu-trgo;;
4) clear ; backup;;
5) clear ; status;;
6) clear ; changesub;;
7) clear ; update;;
8) clear ; certscript;;
9) clear ; license;;
10) clear ; about;;
11) clear ; restart;;
12) clear : reboot;;
13) clear ; wbmn;;
14) clear ; cf-pointing;;
15) clear ; info;;
16) clear ; xol;;
17) clear : speedtest;;
esac
