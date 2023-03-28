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

#color code
export NC='\033[0m'
export multi='\E[41;1;39m'
export cyan='\033[0;36m'
export or='\033[1;33m'
export yl='\e[32;1m'
export rd='\e[31;1m'
export C='\033[0;36m'
export R='\e[31;1m'

function create(){
clear
domain=$(cat /etc/xray/domain)
clear
read -p "Req Username => " Login
read -p "Req Password => " Pass
read -p "Expired (Hari) => " masaaktif

IP=$(wget -qO- ipinfo.io/ip);
ws="$(cat ~/log-install.txt | grep -w "Websocket TLS" | cut -d: -f2|sed 's/ //g')"
ws2="$(cat ~/log-install.txt | grep -w "Websocket HTTP" | cut -d: -f2|sed 's/ //g')"

ssl="$(cat ~/log-install.txt | grep -w "Stunnel5" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
clear
systemctl restart ws-tls
systemctl restart ws-nontls
systemctl restart ssh-ohp
systemctl restart dropbear-ohp
systemctl restart openvpn-ohp
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
expi="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
clear
echo -e ""
echo -e "•──────────────────•"
echo -e " Your Premium Accounts"
echo -e "•──────────────────•"
echo -e "Username : $Login"
echo -e "Password : $Pass"
echo -e "•──────────────────•"
echo -e "» Port Information :"
echo -e "» IP Address : $IP"
echo -e "» Domain : ${domain}"
echo -e "» Websocket NTLS : $ws2"
echo -e "» Websocket TLS : $ws"
echo -e "» Dropbear : 143, 109"
echo -e "» SSL/TLS :$ssl"
echo -e "» Squid :$sqd"
echo -e "» OpenVPN WS : 2086"
echo -e "» Ohp SSH : 8181"
echo -e "» Ohp Dropbear : 8282"
echo -e "» Ohp OpenVPN : 8383"
echo -e "» OpenVPN SSL : 990"
echo -e "» UDPGW : 7100 - 7300"
echo -e "•──────────────────•"
echo -e "•Link Config OpenVPN•"
echo -e "TCP: http://${domain}:89/tcp.ovpn"
echo -e "UDP: http://${domain}:89/udp.ovpn"
echo -e "SSL: http://${domain}:89/ssl.ovpn"
echo -e "•──────────────────•"
echo -e "Created = $hariini"
echo -e "Expired = $expi"
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Menu-SSH"
menu-ssh
}

function trial(){
clear
source /var/lib/fsidvpn/ipvps.conf
if [[ "$IP2" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP2
fi
clear
IP=$(wget -qO- ipinfo.io/ip);
ws="$(cat ~/log-install.txt | grep -w "Websocket TLS" | cut -d: -f2|sed 's/ //g')"
ws2="$(cat ~/log-install.txt | grep -w "Websocket HTTP" | cut -d: -f2|sed 's/ //g')"

ssl="$(cat ~/log-install.txt | grep -w "Stunnel5" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
Login=Trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
hari="1"
Pass=1
clear
systemctl restart ws-tls
systemctl restart ws-nontls
systemctl restart ssh-ohp
systemctl restart dropbear-ohp
systemctl restart openvpn-ohp
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
clear
echo -e ""
echo -e "•──────────────────•"
echo -e " Your Premium Accounts"
echo -e "•──────────────────•"
echo -e "Username : $Login"
echo -e "Password : $Pass"
echo -e "•──────────────────•"
echo -e "» Port Information :"
echo -e "» IP Address : $IP"
echo -e "» Domain : ${domain}"
echo -e "» Websocket NTLS : $ws2"
echo -e "» Websocket : $ws"
echo -e "» Dropbear : 143, 109"
echo -e "» SSL/TLS :$ssl"
echo -e "» Squid :$sqd"
echo -e "» OpenVPN WS : 2086"
echo -e "» Ohp SSH : 8181"
echo -e "» Ohp Dropbear : 8282"
echo -e "» Ohp OpenVPN : 8383"
echo -e "» OpenVPN SSL : 990"
echo -e "» UDPGW : 7100 - 7300"
echo -e "•──────────────────•"
echo -e "•Link Config OpenVPN•"
echo -e "TCP: http://${domain}:89/tcp.ovpn"
echo -e "UDP: http://${domain}:89/udp.ovpn"
echo -e "SSL: http://${domain}:89/ssl.ovpn"
echo -e "•──────────────────•"
echo -e "Created = $hariini"
echo -e "Expired = $expi"
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Menu-SSH"
menu-ssh
}

function renew(){
clear
read -p "Username : " User
egrep "^$User" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
read -p "Day Extend : " Days
Today=`date +%s`
Days_Detailed=$(( $Days * 86400 ))
Expire_On=$(($Today + $Days_Detailed))
Expiration=$(date -u --date="1970-01-01 $Expire_On sec GMT" +%Y/%m/%d)
showexp=$(date -u --date="1970-01-01 $Expire_On sec GMT" '+%d %b %Y')
passwd -u $User
usermod -e  $Expiration $User
egrep "^$User" /etc/passwd >/dev/null
echo -e "$Pass\n$Pass\n"|passwd $User &> /dev/null
clear
echo -e ""
echo -e "════════════════════════════════════════════════════" | lolcat
echo -e " ☞ Username     :  $User"
echo -e " ☞ Days Added   :  $Days Days"
echo -e " ☞ Expired On   :  $showexp"
echo -e " ${C}Rennewall accounts succesfuly.!!${NC}"
echo -e "════════════════════════════════════════════════════" | lolcat
else
clear
echo -e ""
echo -e "======================================" | lolcat
echo -e "        ${R}Username Doesnt Exist${NC}        "
echo -e "======================================" | lolcat
fi
read -n 1 -s -r -p "Tap Enter To Back Menu-SSH"
menu-ssh
}

function hapus(){
clear
echo -e "---------------------------------------------------"
echo -e "${O}USERNAME          EXP DATE          STATUS${NC}"
echo -e "---------------------------------------------------"
while read expired
do
AKUN="$(echo $expired | cut -d: -f1)"
ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
status="$(passwd -S $AKUN | awk '{print $2}' )"
if [[ $ID -ge 1000 ]]; then
if [[ "$status" = "L" ]]; then
printf "%-17s %2s %-17s %2s \n" "=> $AKUN" "$exp     " "LOCKED"
else
printf "%-17s %2s %-17s %2s \n" "=> $AKUN" "$exp     " "UNLOCKED"
fi
fi
done < /etc/passwd
ttl="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
echo -e "---------------------------------------------------"
echo -e ""
read -p "Input Username => " Pengguna
read -p "Reason/Alasan => " warn

if getent passwd $Pengguna > /dev/null 2>&1; then
        userdel $Pengguna
clear
echo -e "
════════════════════════════════════════════════════" | lolcat
echo -e " ☞ Username       : $Pengguna
 ☞ Status         : Hapus/Banned
 ☞ Dihapus Pada   : ${biji}
 ☞ Reason/Alasan  : $warn"
echo -e "════════════════════════════════════════════════════" | lolcat
echo -e ""
else
echo -e "
============================================
      Username ${R}$Pengguna${NC} Tidak Ada.!!
============================================"
echo -e ""
fi
read -n 1 -s -r -p "Tap Enter To Back Menu-SSH"
menu-ssh
}

function cek(){
clear
echo " "
echo " "

if [ -e "/var/log/auth.log" ]; then
        LOG="/var/log/auth.log";
fi
if [ -e "/var/log/secure" ]; then
        LOG="/var/log/secure";
fi
                
data=( `ps aux | grep -i dropbear | awk '{print $2}'`);
echo -e "${C}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}";
echo -e "${multi}             Dropbear User Online/Login            ${NC}";  
echo -e "${C}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}";
echo -e "    ${or}ID  |  Username  |  IP Address${NC}";
echo -e ""
cat $LOG | grep -i dropbear | grep -i "Password auth succeeded" > /tmp/login-db.txt;
for PID in "${data[@]}"
do
        cat /tmp/login-db.txt | grep "dropbear\[$PID\]" > /tmp/login-db-pid.txt;
        NUM=`cat /tmp/login-db-pid.txt | wc -l`;
        USER=`cat /tmp/login-db-pid.txt | awk '{print $10}'`;
        IP=`cat /tmp/login-db-pid.txt | awk '{print $12}'`;
        if [ $NUM -eq 1 ]; then
                echo -e "${yl}☞${NC} $PID - $USER - $IP";
                fi
done
echo " "
echo -e "${C}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}";
echo -e "${multi}             OpenSSH User Online/Login             ${NC}";  
echo -e "${C}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}";
echo -e "    ${or}ID  |  Username  |  IP Address${NC}";
echo -e ""
cat $LOG | grep -i sshd | grep -i "Accepted password for" > /tmp/login-db.txt
data=( `ps aux | grep "\[priv\]" | sort -k 72 | awk '{print $2}'`);

for PID in "${data[@]}"
do
        cat /tmp/login-db.txt | grep "sshd\[$PID\]" > /tmp/login-db-pid.txt;
        NUM=`cat /tmp/login-db-pid.txt | wc -l`;
        USER=`cat /tmp/login-db-pid.txt | awk '{print $9}'`;
        IP=`cat /tmp/login-db-pid.txt | awk '{print $11}'`;
        if [ $NUM -eq 1 ]; then
                echo -e "${yl}☞${NC} $PID - $USER - $IP";
        fi
done
if [ -f "/etc/openvpn/server/openvpn-tcp.log" ]; then
echo ""
echo -e "${C}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}";
echo -e "${multi}              OpenVPN TCP User Login               ${NC}";  
echo -e "${C}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}";
echo -e "${or}Username  |  IP Address  |  Connected${NC}";
echo -e ""
        cat /etc/openvpn/server/openvpn-tcp.log | grep -w "^CLIENT_LIST" | cut -d ',' -f 2,3,8 | sed -e 's/,/      /g' > /tmp/vpn-login-tcp.txt
        cat /tmp/vpn-login-tcp.txt
fi

if [ -f "/etc/openvpn/server/openvpn-udp.log" ]; then
echo " "
echo -e "${C}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}";
echo -e "${multi}              OpenVPN UDP User Login               ${NC}";  
echo -e "${C}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}";
echo -e "${or}Username  |  IP Address  |  Connected${NC}";
echo -e ""
        cat /etc/openvpn/server/openvpn-udp.log | grep -w "^CLIENT_LIST" | cut -d ',' -f 2,3,8 | sed -e 's/,/      /g' > /tmp/vpn-login-udp.txt
        cat /tmp/vpn-login-udp.txt
fi
echo -e "${C}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}";
echo "";
read -n 1 -s -r -p "Tap Enter To Back Menu-SSH"
menu-ssh
}

function exp(){
clear
               hariini=`date +%d-%m-%Y`
               cat /etc/shadow | cut -d: -f1,8 | sed /:$/d > /tmp/expirelist.txt
               totalaccounts=`cat /tmp/expirelist.txt | wc -l`
               for((i=1; i<=$totalaccounts; i++ ))
               do
               tuserval=`head -n $i /tmp/expirelist.txt | tail -n 1`
               username=`echo $tuserval | cut -f1 -d:`
               userexp=`echo $tuserval | cut -f2 -d:`
               userexpireinseconds=$(( $userexp * 86400 ))
               tglexp=`date -d @$userexpireinseconds`             
               tgl=`echo $tglexp |awk -F" " '{print $3}'`
               while [ ${#tgl} -lt 2 ]
               do
               tgl="0"$tgl
               done
               while [ ${#username} -lt 15 ]
               do
               username=$username" " 
               done
               bulantahun=`echo $tglexp |awk -F" " '{print $2,$6}'`
               echo "echo "Expired- User : $username Expire at : $tgl $bulantahun"" >> /usr/local/bin/alluser
               todaystime=`date +%s`
               if [ $userexpireinseconds -ge $todaystime ] ;
               then
		    	:
               else
echo -e "---------------------------------------------"
echo -e "Username   => $username"
echo -e "Expired    => $tgl $bulantahun"
echo -e "Deleted On => $hariini"
echo -e "---------------------------------------------"
echo -e ""
               userdel $username
               fi
               done
               echo "Success Deleted Expiry Account"
               echo -e ""
               read -n 1 -s -r -p "Tap Enter To Back Menu-SSH"
               menu-ssh
}
function list(){
clear
echo -e "---------------------------------------------------"
echo -e "${O}USERNAME          EXP DATE          STATUS${NC}"
echo -e "---------------------------------------------------"
while read expired
do
AKUN="$(echo $expired | cut -d: -f1)"
ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
status="$(passwd -S $AKUN | awk '{print $2}' )"
if [[ $ID -ge 1000 ]]; then
if [[ "$status" = "L" ]]; then
printf "%-17s %2s %-17s %2s \n" "=> $AKUN" "$exp     " "Locked"
else
printf "%-17s %2s %-17s %2s \n" "=> $AKUN" "$exp     " "Unlocked"
fi
fi
done < /etc/passwd
ttl="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
echo -e "---------------------------------------------------"
echo -e " Total Accounts SSH : $ttl"
echo -e "---------------------------------------------------"
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Menu-SSH"
menu-ssh
}
clear
echo -e "${or}════════════════════════════════════════════════════${NC}"
echo -e "       ${cyan}―――――――――――――[${NC}${multi} SSH MENU ${NC}${cyan}]―――――――――――――${NC}"
echo -e "${or}════════════════════════════════════════════════════${NC}"
echo -e " ${rd}1${NC} • Membuat Akun SSH & OpenVPN"
echo -e " ${rd}2${NC} • Trial Akun SSH & OpenVPN"
echo -e " ${rd}3${NC} • Perpanjang Akun SSH & OpenVPN"
echo -e " ${rd}4${NC} • Hapus Akun SSH & OpenVPN"
echo -e " ${rd}5${NC} • Cek Login Akun SSH & OpenVPN"
echo -e " ${rd}6${NC} • List Accounts SSH & OpenVPN"
echo -e ""
echo -e " ${rd}0.${NC} Back To Main Menu ${yl}•${NC}${cyan}•${NC}${or}•${NC}"
echo -e "${or}════════════════════════════════════════════════════${NC}"
echo -e ""
read -p "Input Your Choose : " opt
echo -e ""
case $opt in
01 | 1) clear ; create ;;
02 | 2) clear ; trial ;;
03 | 3) clear ; renew ;;
04 | 4) clear ; hapus ;;
05 | 5) clear ; cek ;;
06 | 6) clear ; list ;;
00 | 0) clear ; menu ;;
esac
