#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
NC="\e[0m"
green="\033[0;32m"
red="\033[0;31m"
###########- END COLOR CODE -##########

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
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
dataexp=$(curl -sS https://raw.githubusercontent.com/bochil132/permission/main/ipmini | grep $MYIP | awk '{print $3}')
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
red='\e[1;31m'
O='\033[0;33m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION
if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
echo -ne
else
echo -e ""
echo -e "${red}Aksess Script Ditolak.!!${NC}"
echo -e "${red}Expired=>${NC} ${dataexp}"
echo -e ""
exit 0
fi
#color code
export NC='\033[0m'
export multi='\E[41;1;39m'
export cyan='\033[0;36m'
export or='\033[1;33m'
export yl='\e[32;1m'
export rd='\e[31;1m'
export C='\033[0;36m'
export R='\e[31;1m'

echo -e ""
function create(){
clear
domain=$(cat /etc/xray/domain)
tls="$(cat ~/log-install.txt | grep -w "Vmess TLS" | cut -d: -f2|sed 's/ //g')"
nontls="$(cat ~/log-install.txt | grep -w "Vmess None TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Req Username => " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username ${RED}${CLIENT_NAME}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (Hari) => " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#xray-vmess-tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'"' /etc/xray/config.json
sed -i '/#xray-vmess-nontls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'"' /etc/xray/config.json
cat>/etc/xray/vmess-$user-tls.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/v2ray",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF
cat>/etc/xray/vmess-$user-nontls.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "${nontls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/v2ray",
      "type": "none",
      "host": "${domain}",
      "tls": "none"
}
EOF
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
xrayv2ray1="vmess://$(base64 -w 0 /etc/xray/vmess-$user-tls.json)"
xrayv2ray2="vmess://$(base64 -w 0 /etc/xray/vmess-$user-nontls.json)"
rm -rf /etc/xray/vmess-$user-tls.json
rm -rf /etc/xray/vmess-$user-nontls.json
systemctl restart xray.service
service cron restart
clear
echo -e ""
echo -e "======-XRAYS/VMESS-======"
echo -e "Remarks     : ${user}"
echo -e "IP Address  : $(curl -sS ipv4.icanhazip.com)"
echo -e "Domain      : ${domain}"
echo -e "Port TLS    : ${tls}"
echo -e "Port No TLS : ${nontls}"
echo -e "User ID     : ${uuid}"
echo -e "Alter ID    : 0"
echo -e "Security    : auto"
echo -e "Network     : ws"
echo -e "Path        : /v2ray"
echo -e "Created     : $hariini"
echo -e "Expired     : $exp"
echo -e "========================="
echo -e "Link TLS    : ${xrayv2ray1}"
echo -e "========================="
echo -e "Link No TLS : ${xrayv2ray2}"
echo -e "========================="
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Menu-Vmess"
menu-vmess
}

function trial(){
clear
sleep 0.5
domain=$(cat /etc/xray/domain)
tls="$(cat ~/log-install.txt | grep -w "Vmess TLS" | cut -d: -f2|sed 's/ //g')"
nontls="$(cat ~/log-install.txt | grep -w "Vmess None TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
user=Trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
		CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username ${RED}${CLIENT_NAME}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
masaaktif="1"
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#xray-vmess-tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'"' /etc/xray/config.json
sed -i '/#xray-vmess-nontls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'"' /etc/xray/config.json
cat>/etc/xray/vmess-$user-tls.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/v2ray",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF
cat>/etc/xray/vmess-$user-nontls.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "${nontls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/v2ray",
      "type": "none",
      "host": "${domain}",
      "tls": "none"
}
EOF
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
xrayv2ray1="vmess://$(base64 -w 0 /etc/xray/vmess-$user-tls.json)"
xrayv2ray2="vmess://$(base64 -w 0 /etc/xray/vmess-$user-nontls.json)"
rm -rf /etc/xray/vmess-$user-tls.json
rm -rf /etc/xray/vmess-$user-nontls.json
systemctl restart xray.service
service cron restart
clear
echo -e ""
echo -e "======-XRAYS/VMESS-======"
echo -e "Remarks     : ${user}"
echo -e "IP Address  : $(curl -sS ipv4.icanhazip.com)"
echo -e "Domain      : ${domain}"
echo -e "Port TLS    : ${tls}"
echo -e "Port No TLS : ${nontls}"
echo -e "User ID     : ${uuid}"
echo -e "Alter ID    : 0"
echo -e "Security    : auto"
echo -e "Network     : ws"
echo -e "Path        : /v2ray"
echo -e "Created     : $hariini"
echo -e "Expired     : $exp"
echo -e "========================="
echo -e "Link TLS    : ${xrayv2ray1}"
echo -e "========================="
echo -e "Link No TLS : ${xrayv2ray2}"
echo -e "========================="
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Menu-Vmess"
menu-vmess
}

function renew(){
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo "Select the existing client you want to renew"
	echo " Press CTRL+C to return"
	echo -e "==============================="
	grep -E "^### " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq | nl
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client => " CLIENT_NUMBER
		else
			read -rp "Select one client => " CLIENT_NUMBER
		fi
	done
read -p "Expired (Days): " masaaktif
user=$(grep -E "^### " "/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/### $user $exp/### $user $exp4/g" /etc/xray/config.json
sed -i "s/### $user $exp/### $user $exp4/g" /etc/xray/config.json
systemctl restart xray.service
service cron restart
clear
echo ""
echo "==============================="
echo "  XRAYS/Vmess Account Renewed  "
echo "==============================="
echo "Username  : $user"
echo "Expired   : $exp4"
echo "==============================="
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Menu-Vmess"
menu-vmess
}

function hapus(){
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo " Select the existing client you want to remove"
	echo " Press CTRL+C to return"
	echo " ==============================="
	echo "     No  User   Expired"
	grep -E "^### " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq | nl
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client => " CLIENT_NUMBER
		else
			read -rp "Select one client => " CLIENT_NUMBER
		fi
	done
user=$(grep -E "^### " "/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
rm -f /etc/xray/vmess-$user-tls.json /etc/xray/vmess-$user-nontls.json
systemctl restart xray.service
clear
echo ""
echo "==============================="
echo "  XRAYS/Vmess Account Deleted  "
echo "==============================="
echo "Username  : $user"
echo "Expired   : $exp"
echo "==============================="
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Menu-Vmess"
menu-vmess
}

function cek(){
clear
echo -n > /tmp/other.txt
data=( `cat /etc/xray/config.json | grep '^###' | cut -d ' ' -f 2`);
echo "----------------------------------------";
echo "---------=[ Vmess User Login ]=---------";
echo "----------------------------------------";
for akun in "${data[@]}"
do
if [[ -z "$akun" ]]; then
akun="tidakada"
fi
echo -n > /tmp/ipvmess.txt
data2=( `netstat -anp | grep ESTABLISHED | grep tcp6 | grep xray | awk '{print $5}' | cut -d: -f1 | sort | uniq`);
for ip in "${data2[@]}"
do
jum=$(cat /var/log/xray/access.log | grep -w $akun | awk '{print $3}' | cut -d: -f1 | grep -w $ip | sort | uniq)
if [[ "$jum" = "$ip" ]]; then
echo "$jum" >> /tmp/ipvmess.txt
else
echo "$ip" >> /tmp/other.txt
fi
jum2=$(cat /tmp/ipvmess.txt)
sed -i "/$jum2/d" /tmp/other.txt > /dev/null 2>&1
done
jum=$(cat /tmp/ipvmess.txt)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
jum2=$(cat /tmp/ipvmess.txt | nl)
echo "user : $akun";
echo "$jum2";
echo "----------------------------------------"
fi
rm -rf /tmp/ipvmess.txt
done
oth=$(cat /tmp/other.txt | sort | uniq | nl)
echo -e "${or}List IP Online :${NC}";
echo -e "${rd}$oth${NC}";
echo "----------------------------------------"
rm -rf /tmp/other.txt
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Menu-Vmess"
menu-vmess
}

clear
echo -e "
${or}════════════════════════════════════════════════════${NC}
      ${cyan}―――――――――――――[${NC}${multi} VMESS MENU ${NC}${cyan}]―――――――――――――${NC}
${or}════════════════════════════════════════════════════${NC}
 ${rd}1.${NC} Buat Akun Xray/Vmess
 ${rd}2.${NC} Buat Akun Trial Xray/Vmess
 ${rd}3.${NC} Perpanjang Akun Xray/Vmess
 ${rd}4.${NC} Hapus Akun Xray/Vmess
 ${rd}5.${NC} Cek Login Xray/Vmess"
echo ""
echo -e " ${rd}0.${NC} Back To Main Menu •••
${or}════════════════════════════════════════════════════${NC}"
echo -e ""
read -p "Input Your Choose : " opt
echo -e ""
case $opt in
01 | 1) clear ; create ;;
02 | 2) clear ; trial ;;
03 | 3) clear ; renew ;;
04 | 4) clear ; hapus ;;
05 | 5) clear ; cek ;;
0) clear ; menu ;;
esac
