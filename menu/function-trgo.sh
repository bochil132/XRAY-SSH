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
Name=$(curl -sS https://raw.githubusercontent.com/bochil132/permission/main/ipmini | grep $MYIP | awk '{print $2}')
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
or='\033[1;33m'
cyan='\033[0;36m'
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
echo -e "
${green}Notif By AutoScript Xray-SSH${NC}
--------------------------------------------------------
You IP ( ${red}${MYIP}${NC} ) blocked By AutoScript
${green}The script you are currently using is out of date${NC}
${green}Please contact the admin to extend the duration${NC}
${O}My Telegram :${NC} @WaanSuka_Turu
--------------------------------------------------------
"
echo -e ""
exit 0
fi

export NC='\033[0m'
export multi='\E[42;1;39m'
export cyan='\033[0;36m'
export or='\033[1;33m'
export yl='\e[32;1m'
export rd='\e[31;1m'
export C='\033[0;36m'
export R='\e[31;1m'

function create(){
clear
uuid=$(cat /etc/trojan-go/uuid.txt)
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
trgo="$(cat ~/log-install.txt | grep -w "Trojan-Go" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
		read -rp "Password : " -e user
		user_EXISTS=$(grep -w $user /etc/trojan-go/akun.conf | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
read -p "Expired (Hari) : " masaaktif
sed -i '/"'""$uuid""'"$/a\,"'""$user""'"' /etc/trojan-go/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
hariini=`date -d "0 days" +"%Y-%m-%d"`
echo -e "### $user $exp" >> /etc/trojan-go/akun.conf
systemctl restart trojan-go.service
link="trojan://${user}@${domain}:${trgo}/?sni=${domain}&type=ws&host=${domain}&path=/directpath&encryption=none#$user"
EOF
cat >/home/vps/public_html/trojanGO-$user.txt <<-END
====================================================================
                  AUTOSCRIPT INSTALLER XRAY-SSH
                       [Sikecil_Waan :D]
====================================================================
            Berikut dibawah ini adalah format OpenClash
====================================================================

- name: TrojanGO-TLS-$user
  server: ${domain}
  port: 2087
  type: trojan
  password: ${user}
  skip-cert-verify: true
  sni: ${domain}
  network: ws
  ws-opts:
    path: /directpath
    headers:
      Host: ${domain}
  udp: true

_______________________________________________________
                Link TrojanGo Account
_______________________________________________________
Link TrojanGO : ${link}
_______________________________________________________
END
clear
sleep 0.8
echo -e ""
echo -e "•──────────────────•"
echo -e "  Trojan-GO Account"
echo -e "•──────────────────•"
echo -e "Remarks    : ${user}"
echo -e "IP Address : $(curl -sS ipv4.icanhazip.com)"
echo -e "Domain     : ${domain}"
echo -e "Port       : ${trgo}"
echo -e "Password   : ${user}"
echo -e "Encryption : none"
echo -e "Path       : /directpath"
echo -e "Created    : $hariini"
echo -e "Expired    : $exp"
echo -e "•──────────────────•"
echo -e "Link Trojan-Go : ${link}"
echo -e "•──────────────────•"
echo -e "Format OpenClash :"
echo -e "${domain}:89/trojanGO-$user.txt"
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Menu-TrojanGO"
menu-trgo
}

function trial(){
clear
uuid=$(cat /etc/trojan-go/uuid.txt)
source /var/lib/fsidvpn/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
trgo="$(cat ~/log-install.txt | grep -w "Trojan-Go" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
user=Trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
		user_EXISTS=$(grep -w $user /etc/trojan-go/akun.conf | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
masaaktif="1"
sed -i '/"'""$uuid""'"$/a\,"'""$user""'"' /etc/trojan-go/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
hariini=`date -d "0 days" +"%Y-%m-%d"`
echo -e "### $user $exp" >> /etc/trojan-go/akun.conf
systemctl restart trojan-go.service
link="trojan://${user}@${domain}:${trgo}/?sni=${domain}&type=ws&host=${domain}&path=/directpath&encryption=none#$user"
EOF
cat >/home/vps/public_html/trojanGO-$user.txt <<-END
====================================================================
                  AUTOSCRIPT INSTALLER XRAY-SSH
                       [Sikecil_Waan :D]
====================================================================
            Berikut dibawah ini adalah format OpenClash
====================================================================

- name: TrojanGO-TLS-$user
  server: ${domain}
  port: 2087
  type: trojan
  password: ${user}
  skip-cert-verify: true
  sni: ${domain}
  network: ws
  ws-opts:
    path: /directpath
    headers:
      Host: ${domain}
  udp: true

_______________________________________________________
                Link TrojanGo Account
_______________________________________________________
Link TrojanGO : ${link}
_______________________________________________________
END
clear
sleep 0.8
echo -e ""
echo -e "•──────────────────•"
echo -e "  Trojan-GO Account"
echo -e "•──────────────────•"
echo -e "Remarks    : ${user}"
echo -e "IP Address : $(curl -sS ipv4.icanhazip.com)"
echo -e "Domain     : ${domain}"
echo -e "Port       : ${trgo}"
echo -e "Password   : ${user}"
echo -e "Encryption : none"
echo -e "Path       : /directpath"
echo -e "Created    : $hariini"
echo -e "Expired    : $exp"
echo -e "•──────────────────•"
echo -e "Link Trojan-Go : ${link}"
echo -e "•──────────────────•"
echo -e "Format OpenClash :"
echo -e "${domain}:89/trojanGO-$user.txt"
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Menu-TrojanGO"
menu-trgo
}

function renew(){
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/trojan-go/akun.conf")
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
	grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 2-3 | column -t | sort | uniq | nl
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client => " CLIENT_NUMBER
		else
			read -rp "Select one client => " CLIENT_NUMBER
		fi
	done
read -p "Expired (Hari) : " masaaktif
user=$(grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/### $user $exp/### $user $exp4/g" /etc/trojan-go/akun.conf
clear
echo ""
echo "============================"
echo "  TrojanGo Account Renewed  "
echo "============================"
echo "Username : $user"
echo "Expired  : $exp4"
echo "=========================="
systemctl restart trojan-go
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Menu-TrojanGO"
menu-trgo
}

function hapus(){
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/trojan-go/akun.conf")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	echo ""
	echo " Select the existing client you want to remove"
	echo " Press CTRL+C to return"
	echo " ==============================="
	echo "     No  User  Expired"
	grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 2-3 | column -t | sort | uniq | nl
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client => " CLIENT_NUMBER
		else
			read -rp "Select one client => " CLIENT_NUMBER
		fi
	done
CLIENT_NAME=$(grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 2-3 | sed -n "${CLIENT_NUMBER}"p)
user=$(grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
sed -i "/^### $user $exp/d" /etc/trojan-go/akun.conf
sed -i '/^,"'"$user"'"$/d' /etc/trojan-go/config.json
systemctl restart trojan-go.service
service cron restart
clear
echo ""
echo "============================"
echo "  TrojanGo Account Deleted  "
echo "============================"
echo "Username : $user"
echo "Expired  : $exp"
echo "============================"
systemctl restart trojan-go
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Menu-TrojanGO"
menu-trgo
}

function cek(){
clear
time=$(date "+%T")
echo ""
echo -n > /tmp/other.txt
data=( `cat /etc/trojan-go/akun.conf | grep '^###' | cut -d ' ' -f 2`);
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}";
echo -e "${multi}      ${rd}Trojan-Go User Login      ${NC}";
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}";
for akun in "${data[@]}"
do
if [[ -z "$akun" ]]; then
akun="tidakada"
fi
echo -n > /tmp/iptrojango.txt
data2=( `netstat -anp | grep ESTABLISHED | grep tcp6 | grep trojan-go | awk '{print $5}' | cut -d: -f1 | sort | uniq`);
for ip in "${data2[@]}"
do
jum=$(cat /var/log/trojan-go/trojan-go.log | grep -w $akun | awk '{print $3}' | cut -d: -f1 | grep -w $ip | sort | uniq)
if [[ "$jum" = "$ip" ]]; then
echo "$jum" >> /tmp/iptrojango.txt
else
echo "$ip" >> /tmp/other.txt
fi
jum2=$(cat /tmp/iptrojango.txt)
sed -i "/$jum2/d" /tmp/other.txt > /dev/null 2>&1
done
jum=$(cat /tmp/iptrojango.txt)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
jum2=$(cat /tmp/iptrojango.txt | nl)
echo "user : $akun";
echo "$jum2";
echo "------------------------------------";
fi
rm -rf /tmp/iptrojango.txt
done
oth=$(cat /tmp/other.txt | sort | uniq | nl)
echo -e "${or}Date Time      :${NC} ${time}";
echo -e "${or}List IP Online :${NC}";
echo -e "${rd}$oth${NC}";
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}";
rm -rf /tmp/other.txt
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Menu-TrojanGO"
menu-trgo
}

clear
# // Status Trgo
ssh_ws=$( systemctl status trojan-go | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ssh_ws == "running" ]]; then
    trgo="${green}Running | Normal${NC}"
else
    trgo="${rd}Stopped | Error${NC}"
fi
echo ""
echo -e "${or}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${multi}                  ${rd}TROJAN-GO MENU                   ${NC}"
echo -e "${or}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "Trojan-Go : $trgo"
echo -e "
 ${rd}1${NC}  Buat Akun Trojan-Go
 ${rd}2${NC}  Trial Akun Trojan-Go
 ${rd}3${NC}  Perpanjang Akun Trojan-Go
 ${rd}4${NC}  Hapus Akun Trojan-Go ( ${rd}Error${NC} )
 ${rd}5${NC}  Cek Login Trojan-Go"
echo ""
echo -e " ${rd}0${NC}  Back To Main Menu ${yl}•${NC}${cyan}•${NC}${or}•${NC}
${or}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -p "Input Your Choose : " opt
echo -e ""
case $opt in
01 | 1) clear ; create ;;
02 | 2) clear ; trial ;;
03 | 3) clear ; renew ;;
04 | 4) clear ; hapus ;;
05 | 5) clear ; cek ;;
00 | 0) clear ; menu ;;
esac
