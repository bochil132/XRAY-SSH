#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`

#color code
export NC='\033[0m'
export multi='\E[41;1;39m'
export cyan='\033[0;36m'
export or='\033[1;33m'
export yl='\e[32;1m'
export rd='\e[31;1m'
export C='\033[0;36m'
export R='\e[31;1m'

function status(){
#########################
# GETTING OS INFORMATION
source /etc/os-release
Versi_OS=$VERSION
ver=$VERSION_ID
Tipe=$NAME
URL_SUPPORT=$HOME_URL
basedong=$ID

# VPS ISP INFORMATION
#ITAM='\033[0;30m'
echo -e "$ITAM"
#REGION=$( curl -s ipinfo.io/region )
#clear
#COUNTRY=$( curl -s ipinfo.io/country )
#clear
#WAKTU=$( curl -s ipinfo.ip/timezone )
#clear
CITY=$( curl -s ipinfo.io/city )
#clear
#REGION=$( curl -s ipinfo.io/region )
#clear

# CHEK STATUS 
openvpn_service="$(systemctl show openvpn.service --no-page)"
oovpn=$(echo "${openvpn_service}" | grep 'ActiveState=' | cut -f2 -d=)
#status_openvp=$(/etc/init.d/openvpn status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
#status_ss_tls="$(systemctl show shadowsocks-libev-server@tls.service --no-page)"
#ss_tls=$(echo "${status_ss_tls}" | grep 'ActiveState=' | cut -f2 -d=)
#status_ss_http="$(systemctl show shadowsocks-libev-server@http.service --no-page)"
#ss_http=$(echo "${status_ss_http}" | grep 'ActiveState=' | cut -f2 -d=)
#sssohtt=$(systemctl status shadowsocks-libev-server@*-http | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
#status="$(systemctl show shadowsocks-libev.service --no-page)"
#status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
tls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nontls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
trojan_server=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
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
#wsopen=$(systemctl status ws-openssh | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
osslh=$(systemctl status sslh | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
ohp=$(systemctl status dropbear-ohp | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
ohq=$(systemctl status openvpn-ohp | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
ohr=$(systemctl status ssh-ohp | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)

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

# STATUS SERVICE Shadowsocks HTTPS
if [[ $sst_status == "running" ]]; then
  status_sst=" ${GREEN}Running ${NC}( No Error )"
else
  status_sst="${RED}  Not Running ${NC}  ( Error )"
fi

# STATUS SERVICE Shadowsocks HTTP
if [[ $ssh_status == "running" ]]; then 
   status_ssh="${GREEN}Online [ Aktif ]${NC}"
else
   status_ssh="${RED}Offline [ Error ]${NC}"
fi

# STATUS SERVICE OPENVPN
if [[ $oovpn == "active" ]]; then
  status_openvpn="${GREEN}Online [ Aktif ]${NC}"
else
  status_openvpn="${RED}Offline [ Error ]${NC}"
fi

# STATUS SERVICE  SSH 
if [[ $ssh_service == "running" ]]; then 
   status_ssh="${GREEN}ON${NC}"
else
   status_ssh="${RED}OFF${NC}"
fi

# STATUS SERVICE  SQUID 
if [[ $squid_service == "running" ]]; then 
   status_squid=" ${GREEN}Running ${NC}( No Error )"
else
   status_squid="${RED}  Not Running"
fi

# STATUS SERVICE  VNSTAT 
if [[ $vnstat_service == "running" ]]; then 
   status_vnstat="${GREEN}ON${NC}"
else
   status_vnstat="${RED}OFF${NC}"
fi

# STATUS SERVICE  CRONS 
if [[ $cron_service == "running" ]]; then 
   status_cron=" ${GREEN}Running ${NC}( No Error )"
else
   status_cron="${RED}  Not Running ${NC}  ( Error )"
fi

# STATUS SERVICE  FAIL2BAN 
if [[ $fail2ban_service == "running" ]]; then 
   status_fail2ban="${GREEN}ON${NC}"
else
   status_fail2ban="${RED}OFF${NC}"
fi

# STATUS SERVICE  TLS 
if [[ $tls_v2ray_status == "running" ]]; then 
   status_tls_v2ray="${GREEN}ON${NC}"
else
   status_tls_v2ray="${RED}OFF${NC}"
fi

# STATUS SERVICE NON TLS V2RAY
if [[ $nontls_v2ray_status == "running" ]]; then 
   status_nontls_v2ray="${GREEN}ON${NC}"
else
   status_nontls_v2ray="${RED}OFF${NC}"
fi

# STATUS SERVICE VLESS HTTPS
if [[ $vless_tls_v2ray_status == "running" ]]; then
  status_tls_vless=" ${GREEN}Running${NC} ( No Error )"
else
  status_tls_vless="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS SERVICE VLESS HTTP
if [[ $vless_nontls_v2ray_status == "running" ]]; then
  status_nontls_vless=" ${GREEN}Running${NC}"
else
  status_nontls_vless="${RED}  Not Running ${NC}"
fi

# SHADOWSOCKSR STATUS
if [[ $ssr_status == "running" ]] ; then
  status_ssr=" ${GREEN}Running${NC} ( No Error )${NC}"
else
  status_ssr="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# SODOSOK
if [[ $status_text == "active" ]] ; then
  status_sodosok=" ${GREEN}Running${NC} ( No Error )${NC}"
else
  status_sodosok="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS SERVICE TROJAN
if [[ $trojan_server == "running" ]]; then 
   status_virus_trojan=" ${GREEN}Running ${NC}( No Error )${NC}"
else
   status_virus_trojan="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS SERVICE WIREGUARD
if [[ $swg == "active" ]]; then
  status_wg=" ${GREEN}Running ${NC}( No Error )${NC}"
else
  status_wg="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# Status Service Trojan GO
if [[ $strgo == "active" ]]; then
  status_trgo=" ${GREEN}Running ${NC}( No Error )${NC}"
else
  status_trgo="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS SERVICE L2TP
if [[ $l2tp_status == "running" ]]; then 
   status_l2tp=" ${GREEN}Running${NC} ( No Error )${NC}"
else
   status_l2tp="${RED}  Not Running${NC}  ( Error )${NC}"
fi

# STATUS SERVICE DROPBEAR
if [[ $dropbear_status == "running" ]]; then 
   status_beruangjatuh="${GREEN}ON${NC}"
else
   status_beruangjatuh="${RED}OFF${NC}"
fi

# STATUS SERVICE STUNNEL
if [[ $stunnel_service == "running" ]]; then 
   status_stunnel="${GREEN}ON${NC}"
else
   status_stunnel="${RED}OFF${NC}"
fi

# STATUS SERVICE SSTP
if [[ $sstp_service == "running" ]]; then 
   status_sstp=" ${GREEN}Running ${NC}( No Error )"
else
   status_sstp="${RED}  Not Running ${NC}  ( Error )"
fi

# STATUS SERVICE WEBSOCKET TLS
if [[ $wstls == "running" ]]; then 
   swstls="${GREEN}ON${NC}"
else
   swstls="${RED}OFF${NC}"
fi

# STATUS SERVICE WEBSOCKET DROPBEAR
if [[ $wsdrop == "running" ]]; then 
   swsdrop="${GREEN}ON${NC}"
else
   swsdrop="${RED}OFF${NC}"
fi

# STATUS SERVICE WEBSOCKET OPEN OVPN
if [[ $wsovpn == "running" ]]; then 
   swsovpn="${GREEN}ON${NC}"
else
   swsovpn="${RED}OFF${NC}"
fi

# STATUS SERVICE SSLH / SSH
if [[ $osslh == "running" ]]; then 
   sosslh="${GREEN}ON${NC}"
else
   sosslh="${RED}OFF${NC}"
fi

# STATUS OHP DROPBEAR
if [[ $ohp == "running" ]]; then 
   sohp="${GREEN}ON${NC}"
else
   sohp="${RED}OFF${NC}"
fi

# STATUS OHP OpenVPN
if [[ $ohq == "running" ]]; then 
   sohq="${GREEN}ON${NC}"
else
   sohq="${RED}OFF${NC}"
fi

# STATUS OHP SSH
if [[ $ohr == "running" ]]; then 
   sohr="${GREEN}ON${NC}"
else
   sohr="${RED}OFF${NC}"
fi

# STATUS SERVICE WEBSOCKET OPENSSH
if [[ $wsopen == "running" ]]; then 
   swsopen="${GREEN}ON${NC}" 
else
   swsopen="${RED}OFF${NC}"
fi

# STATUS SERVICE SSHD
if [[ $shd == "running" ]]; then 
   shdd="${GREEN}ON${NC}" 
else
   shdd="${RED}OFF${NC}"
fi

# STATUS SERVICE BADVPN
if [[ $udp == "running" ]]; then 
   udpw="${GREEN}ON${NC}" 
else
   udpw="${RED}OFF${NC}"
fi

# STATUS SERVICE CRON
if [[ $cron == "running" ]]; then 
   cr="${GREEN}ON${NC}" 
else
   cr="${RED}OFF${NC}"
fi

# STATUS SERVICE SQUID
if [[ $sqd == "running" ]]; then 
   sq="${GREEN}ON${NC}" 
else
   sq="${RED}OFF${NC}"
fi

# STATUS SERVICE NGINX
if [[ $nginx == "running" ]]; then 
   nx="${GREEN}ON${NC}" 
else
   nx="${RED}OFF${NC}"
fi
clear

echo -e ""
clear
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
echo -e " ${ORANGE}Current Domain      => $DOMAIN"
echo -e " Current IP VPS      => $IPVPS"
echo -e " Your Isp Vps        => $sp"
echo -e " Your City Vps       => $ct"
echo -e " OS Version          => "`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`
echo -e " Number Of Cores     => $core Core"
echo -e " System Uptime       => $up"
echo -e " Cpu Model           =>$cpu"
echo -e " Total Ram           => $tram MB / Used $uram MB"
echo -e " Available Storage   => $(df -h / | awk '{print $4}' | tail -n1 | sed 's/G//g' | sed 's/ //g') GB"
echo -e " Total Storage       => $(df -h / | awk '{print $2}' | tail -n1 | sed 's/G//g' | sed 's/ //g') GB"
echo -e " Used Storage        => $(df -h / | awk '{print $3}' | tail -n1 | sed 's/G//g' | sed 's/ //g') GB"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e " ${green}•${NC} NGINX           => $nx"
echo -e " ${green}•${NC} SSH / TUN       => $status_ssh"
echo -e " ${green}•${NC} OVPN WS         => $swsovpn"
echo -e " ${green}•${NC} DROPBEAR        => $status_beruangjatuh"
echo -e " ${green}•${NC} VNSTAT          => $status_vnstat"
echo -e " ${green}•${NC} WS STUNNEL      => $swstls"
echo -e " ${green}•${NC} WS DROPBEAR     => $swsdrop"
echo -e " ${green}•${NC} STUNNEL         => $status_stunnel"
echo -e " ${green}•${NC} SSLH            => $sosslh"
echo -e " ${green}•${NC} FAIL2BAN        => $status_fail2ban"
echo -e " ${green}•${NC} OHP SSH         => $sohr"
echo -e " ${green}•${NC} OHP DROPBEAR    => $sohp"
echo -e " ${green}•${NC} SSHD            => $shdd"
echo -e " ${green}•${NC} BADVPN UDPGW    => $udpw"
echo -e " ${green}•${NC} CRONTAB         => $cr"
echo -e " ${green}•${NC} SQUID PROXY     => $sq"
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Home-Menu"
menu
}

function update(){
clear
echo -e "
=================================================
        ${or}Progress Update AutoScript XRAY-SSH${NC}
================================================="
sleep 1
wget -q -O /usr/bin/menu "https://stn-cloud.my.id/menu/menu.sh" && chmod +x /usr/bin/menu
wget -q -O /usr/bin/license "https://stn-cloud.my.id/menu/license.sh" && chmod +x /usr/bin/license
wget -q -O /usr/bin/backup "https://stn-cloud.my.id/backup/backup.sh" && chmod +x /usr/bin/backup
sleep 2
echo -e "${green}Update AutoScript XRAY-SSH Succesfuly${NC}"
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
echo -e "[ ${green}INFO${NC} ] Start " 
sleep 0.5
systemctl stop ws-nontls
systemctl stop nginx
domain=$(cat /var/lib/fsidvpn/ipvps.conf | cut -d'=' -f2)
Cek=$(lsof -i:80 | cut -d' ' -f1 | awk 'NR==2 {print $1}')
if [[ ! -z "$Cek" ]]; then
sleep 1
echo -e "[ ${RED}WARNING${NC} ] Detected port 80 used by $Cek " 
systemctl stop $Cek
sleep 2
echo -e "[ ${GREEN}INFO${NC} ] Processing to stop $Cek " 
sleep 1
fi
echo -e "[ ${GREEN}INFO${NC} ] Starting renew cert... " 
sleep 2
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
/root/.acme.sh/acme.sh --issue -d $domain --force --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
echo -e "[ ${GREEN}INFO${NC} ] Renew cert done... " 
sleep 2
echo -e "[ ${GREEN}INFO${NC} ] Starting service $Cek " 
sleep 2
echo "$domain" >/etc/xray/domain
systemctl restart $Cek
systemctl restart nginx
echo -e "[ ${GREEN}INFO${NC} ] All finished... " 
sleep 0.5
clear
echo -e ""
echo -e "Starting Restart All Service"
sleep 2
systemctl restart ws-tls
systemctl restart ws-nontls
systemctl restart xray
systemctl restart ws-ovpn
systemctl restart ssh-ohp
systemctl restart dropbear-ohp
systemctl restart openvpn-ohp
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
echo -e "${RED}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$nc"
echo -e "${GREEN}               • RENEW DOMAIN SSL •               $nc"
echo -e "${RED}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$nc"
echo -e ""
echo -e "[ ${green}INFO${NC} ] Start " 
sleep 0.5
systemctl stop ws-nontls
systemctl stop nginx
domain=$(cat /var/lib/fsidvpn/ipvps.conf | cut -d'=' -f2)
Cek=$(lsof -i:80 | cut -d' ' -f1 | awk 'NR==2 {print $1}')
if [[ ! -z "$Cek" ]]; then
sleep 1
echo -e "[ ${RED}WARNING${NC} ] Detected port 80 used by $Cek " 
systemctl stop $Cek
sleep 2
echo -e "[ ${GREEN}INFO${NC} ] Processing to stop $Cek " 
sleep 1
fi
echo -e "[ ${GREEN}INFO${NC} ] Starting renew cert... " 
sleep 2
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
/root/.acme.sh/acme.sh --issue -d $domain --force --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
echo -e "[ ${GREEN}INFO${NC} ] Renew cert done... " 
sleep 2
echo -e "[ ${GREEN}INFO${NC} ] Starting service $Cek " 
sleep 2
echo "$domain" > /etc/xray/domain
systemctl restart $Cek
systemctl restart nginx
echo -e "[ ${GREEN}INFO${NC} ] All finished... " 
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
systemctl restart ssh-ohp
systemctl restart dropbear-ohp
systemctl restart openvpn-ohp
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

clear
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
${or}══════════════════════════════════════════════════════════════════${NC}
     ${cyan}―――――――――――――[${NC}${multi} Menu AutoScript XRAY-SSH ${NC}${cyan}]―――――――――――――${NC}
${or}══════════════════════════════════════════════════════════════════${NC}
${rd}Download Usage  :${NC} ${downusage}
${rd}Upload Usage    :${NC} ${upusage}
${rd}Total Usage     :${NC} ${tousage}
${or}══════════════════════════════════════════════════════════════════${NC}
 ${rd}•1.${NC} Menu SSH & OpenVPN Websocket
 ${rd}•2.${NC} Menu Vmess Websocket
 ${rd}•3.${NC} Menu Trojan-Go / Websocket
 ${rd}•4.${NC} Menu Backup & Restore
 ${rd}•5.${NC} Status Layanan Script
 ${rd}•6.${NC} Ganti Domain / Subdomain
 ${rd}•7.${NC} Update AutoScript Installer
 ${rd}•8.${NC} Renew Certificate SSL / XRAY
 ${rd}•9.${NC} Admin Aksess Script
 ${rd}10.${NC} About AutoScript Installer
 ${rd}11.${NC} Restart All Service AutoScript
 ${rd}12.${NC} Reboot You VPS
 ${rd}13.${NC} Install Webmin Menu

Tap [ ${rd}CTRL + C${NC} ] To Exit Menu AutoScript
${or}══════════════════════════════════════════════════════════════════${NC}
${cyan}SSH & OpenVPN Websocket  :${NC} ${rd}${sshws}${NC} Accounts
${cyan}V2ray Vmess Websocket    :${NC} ${rd}${vmess}${NC} Accounts
${cyan}Trojan-Go / Websocket    :${NC} ${rd}${trojanws}${NC} Accounts
${or}══════════════════════════════════════════════════════════════════${NC}
${rd}Informasi Date      :${NC} ${datainfo}
${rd}Nama Pengguna       :${NC} ${client}
${rd}Expired AutoScript  :${NC} ${expscript}
${rd}Sisa MasaAktif      :${NC} ${dayleft} Days Left
${or}══════════════════════════════════════════════════════════════════${NC}"
echo -e ""
read -p "Select Menu Options : " opt
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
esac