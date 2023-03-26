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
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGREEN='\033[1;92m'      # GREEN
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGREEN='\033[0;92m'       # GREEN
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
NC='\e[0m'

# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'
GREEN() { echo -e "\\033[32;1m${*}\\033[0m"; }
RED() { echo -e "\\033[31;1m${*}\\033[0m"; }


clear

function backup(){
clear
IP=$(curl -sS ipv4.icanhazip.com);
apigit=$(cat /etc/bckp/token.txt)
emailgit=$(cat /etc/bckp/gmail.txt)
bckpdata=$(date)
date=$(date +"%Y-%m-%d")

clear
echo -e "[ ${GREEN}INFO${NC} ] Create Data Backup For VPS"
#read -rp "Enter Token (Contact Admin) : " -e token
read -rp "Enter Name File Backup => " -e NameUser
read -rp "Create Password => " -e InputPass
sleep 1
if [[ -z $InputPass ]]; then
exit 0
fi
echo -e "[ ${GREEN}INFO${NC} ] Prosess... "
mkdir -p /root/backup
sleep 1

cp -r /root/.acme.sh /root/backup/ &> /dev/null
cp -r /etc/passwd /root/backup/ &> /dev/null
cp -r /etc/group /root/backup/ &> /dev/null
cp -r /etc/shadow /root/backup/ &> /dev/null
cp -r /etc/gshadow /root/backup/ &> /dev/null
#cp -r /etc/wireguard /root/backup/wireguard &> /dev/null
cp -r /etc/ppp/chap-secrets /root/backup/chap-secrets &> /dev/null
#cp -r /etc/ipsec.d/passwd /root/backup/passwd1 &> /dev/null
#cp -r /etc/shadowsocks-libev/akun.conf /root/backup/ss.conf &> /dev/null
cp -r /var/lib/fsidvpn/ /root/backup/fsidvpn &> /dev/null
#cp -r /home/sstp /root/backup/sstp &> /dev/null
cp -r /etc/v2ray /root/backup/v2ray &> /dev/null
cp -r /etc/xray /root/backup/xray &> /dev/null
cp -r /etc/nginx/conf.d /root/backup/conf.d/ &> /dev/null
cp -r /etc/trojan-go /root/backup/trojan-go &> /dev/null
#cp -r /usr/local/shadowsocksr/ /root/backup/shadowsocksr &> /dev/null
cp -r /home/vps/public_html /root/backup/public_html &> /dev/null
cp -r /etc/cron.d /root/backup/cron.d &> /dev/null
cp -r /etc/crontab /root/backup/crontab &> /dev/null
cd /root
zip -rP $InputPass $NameUser.zip backup > /dev/null 2>&1

##############++++++++++++++++++++++++#############
LLatest=`date`
Get_Data () {
git clone https://github.com/WanEuy22/backup.git /root/user-backup/ &> /dev/null
}

Mkdir_Data () {
mkdir -p /root/user-backup/$NameUser
}

Input_Data_Append () {
if [ ! -f "/root/user-backup/$NameUser/$NameUser-last-backup" ]; then
touch /root/user-backup/$NameUser/$NameUser-last-backup
fi
echo -e "User         : $NameUser
last-backup : $LLatest
" >> /root/user-backup/$NameUser/$NameUser-last-backup
mv /root/$NameUser.zip /root/user-backup/$NameUser/
}

Save_And_Exit () {
    cd /root/user-backup
    git config --global user.email "${emailgit}" &> /dev/null
    git config --global user.name "WanEuy22" &> /dev/null
    rm -fr .git &> /dev/null
    git init &> /dev/null
    git add . &> /dev/null
    git commit -m m &> /dev/null
    git branch -M main &> /dev/null
    git remote add origin https://github.com/WanEuy22/backup
    git push -f https://${apigit}@github.com/WanEuy22/backup.git &> /dev/null
}

if [ ! -d "/root/user-backup/" ]; then
sleep 1
echo -e "[ ${GREEN}INFO${NC} ] Mengambil Database... "
Get_Data
Mkdir_Data
sleep 1
echo -e "[ ${GREEN}INFO${NC} ] Mengambil info server... "
Input_Data_Append
sleep 1
echo -e "[ ${GREEN}INFO${NC} ] Prosess update server... "
Save_And_Exit
fi
linkbckp="https://backup.stn-cloud.my.id/$NameUser/$NameUser.zip"
sleep 1
echo -e "[ ${GREEN}INFO${NC} ] Backup Selesai.!! "
sleep 1
echo
sleep 1
echo -e "[ ${GREEN}INFO${NC} ] Prosess Membuat Link Backup... "
echo
sleep 2
clear
echo -e "
Mohon simpan data di bawah ini.!!
===============================================
Name Backup  : ${NameUser}
Backup Date  : ${bckpdata}
Password nya : ${InputPass}
IP Address   : ${MYIP}
Link Backup  : ${linkbckp}
===============================================
"
rm -fr /root/backup &> /dev/null
rm -fr /root/user-backup &> /dev/null
rm -f /root/$NameUser.zip &> /dev/null
cd
echo
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Menu-Backup"
backup
}

function token(){
read -p "Input You Token : " api
read -p "Input You Email : " gmail
echo "$api" >/etc/bckp/token.txt
echo "$gmail" >/etc/bckp/gmail.txt
sleep 2.5
echo -e "
[${GREEN}✓${NC}] × ${RED}OK Done Setting Token Backup${NC}
[${GREEN}✓${NC}] × ${RED}Backup Is Ready${NC}"
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Menu-Backup"
backup
}

function restore(){
cd
read -rp "Enter Name Backup => " -e NameUser

cekdata=$(curl -sS https://raw.githubusercontent.com/WanEuy22/backup/main/$NameUser/$NameUser.zip | grep 404 | awk '{print $1}' | cut -d: -f1)

[[ "$cekdata" = "404" ]] && {
red "Data not found / you never backup"
exit 0
} || {
GREEN "Data found for name $NameUser"
}

echo -e "[ ${GREEN}INFO${NC} ] • Restore Data..."
read -rp "Password Backup => " -e InputPass
echo -e "[ ${GREEN}INFO${NC} ] • Downloading data.."
mkdir -p /root/backup
wget -q -O /root/backup/backup.zip "https://raw.githubusercontent.com/WanEuy22/backup/main/$NameUser/$NameUser.zip" &> /dev/null
echo -e "[ ${GREEN}INFO${NC} ] • Getting your data..."
unzip -P $InputPass /root/backup/backup.zip &> /dev/null
echo -e "[ ${GREEN}INFO${NC} ] • Starting to restore data..."
rm -f /root/backup/backup.zip &> /dev/null
sleep 1
cd /root/backup
echo -e "[ ${GREEN}INFO${NC} ] • Restoring passwd data..."
sleep 1
cp -r /root/backup/passwd /etc/ &> /dev/null
echo -e "[ ${GREEN}INFO${NC} ] • Restoring group data..."
sleep 1
cp -r /root/backup/group /etc/ &> /dev/null
echo -e "[ ${GREEN}INFO${NC} ] • Restoring shadow data..."
sleep 1
cp -r /root/backup/shadow /etc/ &> /dev/null
echo -e "[ ${GREEN}INFO${NC} ] • Restoring gshadow data..."
sleep 1
cp -r /root/backup/gshadow /etc/ &> /dev/null
echo -e "[ ${GREEN}INFO${NC} ] • Restoring chap-secrets data..."
sleep 1
cp -r /root/backup/chap-secrets /etc/ppp/ &> /dev/null
echo -e "[ ${GREEN}INFO${NC} ] • Restoring passwd1 data..."
sleep 1
cp -r /root/backup/passwd1 /etc/ipsec.d/passwd &> /dev/null
echo -e "[ ${GREEN}INFO${NC} ] • Restoring ss.conf data..."
sleep 1
#cp -r /root/backup/ss.conf /etc/shadowsocks-libev/ss.conf &> /dev/null
#echo -e "[ ${GREEN}INFO${NC} ] • Restoring admin data..."
#sleep 1
cp -r /root/backup/fsidvpn /var/lib/ &> /dev/null
#cp -r /root/backup/wireguard /etc/ &> /dev/null
cp -r /root/backup/.acme.sh /root/ &> /dev/null
#cp -r /root/backup/sstp /home/ &> /dev/null
cp -r /root/backup/trojan-go /etc/ &> /dev/null
cp -r /root/backup/v2ray /etc/ &> /dev/null
cp -r /root/backup/xray /etc/ &> /dev/null
cp -r /root/backup/conf.d /etc/nginx/ &> /dev/null
#cp -r /root/backup/shadowsocksr /usr/local/ &> /dev/null
cp -r /root/backup/public_html /home/vps/ &> /dev/null
cp -r /root/backup/crontab /etc/ &> /dev/null
cp -r /root/backup/cron.d /etc/ &> /dev/null
rm -fr /root/backup &> /dev/null
echo -e "[ ${GREEN}INFO${NC} ] • Done..."
sleep 1
rm -f /root/backup/backup.zip &> /dev/null
cd
systemctl restart xray
systemctl restart nginx
echo
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Menu-Backup"
backup
}
clear
echo -e "
${CYAN}=========================================${NC}
           ${RED}Backup / Restore${NC}
${CYAN}=========================================${NC}
 ${RED}1.${NC} Backup Data VPS To GitHub
 ${RED}2.${NC} Restore Data VPS
 ${RED}3.${NC} Setting Token Backup"
echo -e "
${GREEN}must enter the backup token to succeed${NC}
${CYAN}=========================================${NC}"
echo "Tap Enter To Back Home-Menu"
echo ""
read -p "Select menu : " opt
echo -e ""
case $opt in
1) clear ; backup;;
#2) clear ; bckp ;;
2) clear ; restore;;
3) clear ; token;;
0) clear ; menu ;;
x) exit ;;
*) echo -e "" ; echo "Press any key to back on menu" ; sleep 1 ; menu ;;
esac
