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
export multi='\E[41;1;39m'
export NC='\033[0m'
GREEN() { echo -e "\\033[32;1m${*}\\033[0m"; }
RED() { echo -e "\\033[31;1m${*}\\033[0m"; }
# // My Code
IP=$(curl -sS ipv4.icanhazip.com);
apigit=$(cat /etc/bckp/token.txt)
emailgit=$(cat /etc/bckp/gmail.txt)
gue=$(cat /etc/show/gue.txt)
dia=$(cat /etc/show/dia.txt)
domainname=$(cat /etc/xray/domain)
namegit=$(cat /etc/bckp/name.txt)
reponame=$(cat /etc/bckp/repo.txt)
date=$(date +"%Y-%m-%d")

clear
function bckp_manual(){
clear
if [ -f "/etc/show/dia.txt" ]; then
clear
NameUser=bckp`</dev/urandom tr -dc X-Z0-9 | head -c4`
read -rp "$(echo -e "${IWhite}Server Name Info : ${NC}")" -e servername
read -rp "$(echo -e "${IWhite}Password Backup  : ${NC}")" -e InputPass
sleep 1
if [[ -z $InputPass ]]; then
exit 0
fi
echo -e "[ ${GREEN}Wait${NC} ] Processing... "
mkdir -p /root/backup
sleep 1

cp -r /etc/bckp /root/backup/bckp/ &> /dev/null
cp -r /etc/show /root/backup/show/ &> /dev/null
cp -r /root/.acme.sh /root/backup/ &> /dev/null
cp -r /etc/xray /root/backup/xray/ &> /dev/null
cp -r /etc/trojan-go /root/backup/trojan-go/ &> /dev/null
cp -r /etc/passwd /root/backup/ &> /dev/null
cp -r /etc/group /root/backup/ &> /dev/null
cp -r /etc/shadow /root/backup/ &> /dev/null
cp -r /etc/gshadow /root/backup/ &> /dev/null
cp -r /etc/ppp/chap-secrets /root/backup/chap-secrets &> /dev/null
cp -r /var/lib/fsidvpn/ /root/backup/fsidvpn &> /dev/null
cp -r /etc/nginx/conf.d /root/backup/conf.d/ &> /dev/null
cp -r /home/vps/public_html /root/backup/public_html &> /dev/null
cp -r /etc/cron.d /root/backup/cron.d &> /dev/null
cp -r /etc/crontab /root/backup/crontab &> /dev/null
cd /root
zip -rP $InputPass $NameUser.zip backup > /dev/null 2>&1

##############++++++++++++++++++++++++#############
LLatest=`date`
Get_Data () {
git clone https://github.com/${namegit}/${reponame}.git /root/user-backup/ &> /dev/null
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
    git config --global user.name "${namegit}" &> /dev/null
    rm -fr .git &> /dev/null
    git init &> /dev/null
    git add . &> /dev/null
    git commit -m m &> /dev/null
    git branch -M main &> /dev/null
    git remote add origin https://github.com/${namegit}/${reponame}
    git push -f https://${apigit}@github.com/${namegit}/${reponame}.git &> /dev/null
}

if [ ! -d "/root/user-backup/" ]; then
sleep 1
echo -e "[ ${RED}Wait${NC} ] Getting database... "
Get_Data
Mkdir_Data
sleep 0.5
echo -e "[ ${RED}Wait${NC} ] Getting info server... "
Input_Data_Append
sleep 0.5
echo -e "[ ${RED}Wait${NC} ] Processing updating server...... "
Save_And_Exit
fi
link="https://raw.githubusercontent.com/${namegit}/${reponame}/main/${NameUser}/${NameUser}.zip"
sleep 0.5
echo -e "[ ${GREEN}Note${NC} ] Backup done "
sleep 1
echo -e "
${RED}Berikut dibawah ini adalah link backup anda${NC}
${GREEN}$link${NC}"
html="
<b>====🍀Backup Manual🍀====</b>
────────────────────
<i>Domain     : ${domainname}</i>
<i>My IP         : ${IP}</i>
<i>Server       : ${servername}</i>
<i>Name        : ${NameUser}</i>
<i>Password : ${InputPass}</i>
────────────────────
<i>${link}</i>
────────────────────
"
curl -s --max-time 10 -d "chat_id=${gue}r&disable_web_page_preview=1&text=${html}&parse_mode=html" https://api.telegram.org/bot${dia}/sendMessage >/dev/null

rm -fr /root/backup &> /dev/null
rm -fr /root/user-backup &> /dev/null
rm -f /root/$NameUser.zip &> /dev/null
cd
echo
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Menu"
backup
exit 0
fi
echo -e "${RED}Key No Detected :(${NC}"
}

function Input_key(){
if [ -f "/etc/bckp/gmail.txt" ]; then
echo -e "===============================" | lolcat
echo -e " ${RED}Duplicate Detected.!!${NC}"
echo -e "===============================" | lolcat
echo ""
read -n 1 -s -r -p "Tap enter to back"
backup
exit 0
fi
read -p "Input Github Key   : " key
sleep 0.3
read -p "Input Github Email : " gmail
sleep 0.3
read -p "Input Github Name  : " namegit
sleep 0.3
read -p "Input Github Repo  : " repogit
sleep 0.3
read -p "Input Bot Token    : " bottoken
sleep 0.3
read -p "Input ID User      : " myid
sleep 1
rm -rf /etc/bckp
rm -rf /etc/show
mkdir -p /etc/bckp/
mkdir -p /etc/show/
echo "$namegit" >/etc/bckp/name.txt
echo "$repogit" >/etc/bckp/repo.txt
echo "$key" >/etc/bckp/token.txt
echo "$gmail" >/etc/bckp/gmail.txt
echo "$bottoken" >/etc/show/dia.txt
echo "$myid" >/etc/show/gue.txt
sleep 2.5
echo -e "
[${GREEN}✓${NC}] × ${RED}OK Done Setting Key Backup${NC}
[${GREEN}✓${NC}] × ${RED}Backup Is Ready${NC}"
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Menu"
backup
}

function restore(){
if [ -f "/etc/bckp/token.txt" ]; then
echo -e "===============================" | lolcat
echo -e " ${RED}Key Not Faund :(${NC}"
echo -e "===============================" | lolcat
echo ""
read -n 1 -s -r -p "Tap enter to back"
backup
exit 0
fi
cd
read -rp "Enter Backup Name  : " -e NameUser
read -rp "Password Backup    : " -e InputPass
cekdata=$(curl -sS https://raw.githubusercontent.com/${namegit}/${reponame}/main/$NameUser/$NameUser.zip | grep 404 | awk '{print $1}' | cut -d: -f1)

[[ "$cekdata" = "404" ]] && {
echo -e "${IRed}Backup name $NameUser not available.!${NC}"
exit 0
} || {
GREEN "Backup name $NameUser available.!"
}

echo -e "[ ${RED}Wait${NC} ] • Restore Data..."
sleep 1
echo -e "[ ${GREEN}Note${NC} ] • Downloading data.."
mkdir -p /root/backup
wget -q -O /root/backup/backup.zip "https://raw.githubusercontent.com/${namegit}/${reponame}/main/$NameUser/$NameUser.zip" &> /dev/null
echo -e "[ ${GREEN}Note${NC} ] • Getting your data..."
unzip -P $InputPass /root/backup/backup.zip &> /dev/null
echo -e "[ ${GREEN}Note${NC} ] • Starting to restore data..."
rm -f /root/backup/backup.zip &> /dev/null
sleep 1
cd /root/backup
echo -e "[ ${GREEN}Note${NC} ] • Restoring passwd data..."
sleep 1
cp -r /root/backup/passwd /etc/ &> /dev/null
echo -e "[ ${GREEN}Note${NC} ] • Restoring group data..."
sleep 1
cp -r /root/backup/group /etc/ &> /dev/null
echo -e "[ ${GREEN}Note${NC} ] • Restoring shadow data..."
sleep 1
cp -r /root/backup/shadow /etc/ &> /dev/null
echo -e "[ ${GREEN}Note${NC} ] • Restoring gshadow data..."
sleep 1
cp -r /root/backup/gshadow /etc/ &> /dev/null
echo -e "[ ${GREEN}Note${NC} ] • Restoring chap-secrets data..."
sleep 1
cp -r /root/backup/chap-secrets /etc/ppp/ &> /dev/null
echo -e "[ ${GREEN}Note${NC} ] • Restoring passwd1 data..."
sleep 1
cp -r /root/backup/passwd1 /etc/ipsec.d/passwd &> /dev/null
sleep 1
echo -e "[ ${GREEN}Note${NC} ] • Restoring xray data.."
cp -r /root/backup/xray /etc/ &> /dev/null
sleep 1
echo -e "[ ${GREEN}Note${NC} ] • Restoring etc data.."
cp -r /root/backup/bckp /etc/ &> /dev/null
cp -r /root/backup/show /etc/ &> /dev/null
cp -r /root/backup/trojan-go /etc/ &> /dev/null
cp -r /root/backup/fsidvpn /var/lib/ &> /dev/null
cp -r /root/backup/.acme.sh /root/ &> /dev/null
cp -r /root/backup/conf.d /etc/nginx/ &> /dev/null
cp -r /root/backup/public_html /home/vps/ &> /dev/null
cp -r /root/backup/crontab /etc/ &> /dev/null
cp -r /root/backup/cron.d /etc/ &> /dev/null
rm -fr /root/backup &> /dev/null
echo -e "[ ${GREEN}Success${NC} ] • Done..."
sleep 1
rm -f /root/backup/backup.zip &> /dev/null
cd
clear
echo -e "${GREEN}Change password, please input new password${NC}"
echo -e ""
passwd
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Menu"
backup
}
function Delete_key(){
clear
read -p "Yakin ingin menghapus ? y/n : " choose
echo -e ""
case $choose in
y)
echo -e "${YELLOW}Progress Deleted Data${NC}"
echo ""
sleep 1
echo -e "======[ ${RED}10℅${NC} ]======"
sleep 1
echo -e "======[ ${GREEN}20%${NC} ]======"
sleep 1
echo -e "======[ ${RED}30%${NC} ]======"
sleep 1
echo -e "======[ ${GREEN}40%${NC} ]======"
sleep 1
echo -e "======[ ${RED}50%${NC} ]======"
sleep 1
echo -e "======[ ${GREEN}85%${NC} ]======"
sleep 2
echo -e "======[ ${CYAN}100%${NC} ]====="
sleep 1
rm -rf /etc/show
rm -rf /etc/bckp
echo -e "
=====================================
 Deleted data completed succesfully
=====================================
" | lolcat
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back"
backup
;;
n)
echo -e "${RED}Penghapusan dibatalkan by user${NC}"
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back"
backup
;;
esac
}

function bckp_auto(){
clear
echo -e "${CYAN}Only use automatic backups if necessary.!!${NC}"
echo -e "(${BLUE}Y${NC}) Start (${RED}N${NC}) Stop"
echo ""
read -p "Type y/n : " type
echo -e ""
case $type in
y | Y)
sleep 1
clear
echo "0 18 * * * root aubckp" >> /etc/crontab
echo ""
sleep 0.5
echo -e "${CYAN}Auto backup started in${NC} ${RED}18:00 wib${NC}"
echo -e "${CYAN}Auto send data to your bot${NC}"
;;
n | N)
clear
sleep 0.5
echo -e "      👇Stop auto backup in here👇"
echo -e "${PURPLE}────────────────────────────────────────${NC}"
echo -e "    ${IWhite}Type command${NC} ${CYAN}nano /etc/crontab${NC}"
echo -e "  ${IWhite}Delete text${NC} ${RED}0 18 * * * root aubckp${NC}"
echo -e "    ${IWhite}Save Tap${NC} [ ${RED}CTRL + X & y Enter${NC} ]"
echo -e "     ${IWhite}And restart all service. Done${NC}"
echo -e "   ${RED}Or delete key to stop auto backup${NC}"
echo -e "${PURPLE}────────────────────────────────────────${NC}"
echo ""
read -n 1 -s -r -p "Tap Enter To Back.!!"
backup
esac
}

function show_key(){
if [ -f "/etc/bckp/gmail.txt" ]; then
clear
echo -e "
${PURPLE}• Github_Email :${NC} ${emailgit}
${PURPLE}• Github_Name  :${NC} ${namegit}
${PURPLE}• Github_Repo  :${NC} ${reponame}
${PURPLE}• Github_Key   :${NC} ${apigit}
${PURPLE}• User_ID      :${NC} ${gue}
${PURPLE}• Bot_Token    :${NC} ${dia}
"
read -n 1 -s -r -p "Tap Enter To Back.!!"
backup
exit 0
fi
echo -e "${RED}Key No Detected :(${NC}"
echo ""
}
clear
echo -e "
${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}
${multi}            Backup / Restore              ${NC}
${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}
 ${RED}1.)${NC} Backup Manual
 ${RED}2.)${NC} Backup Auto
 ${RED}3.)${NC} Restore Data"
 echo -e "
 ${RED}4.)${NC} Input Key
 ${RED}5.)${NC} Delete Key
 ${RED}6.)${NC} Show Key"
echo -e "
${GREEN}input key is required first!!${NC}
${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo "Tap Enter To Back Home-Menu"
echo ""
read -p "Select menu : " opt
echo -e ""
case $opt in
1) clear ; bckp_manual;;
2) clear ; bckp_auto;;
3) clear ; restore;;
4) clear ; Input_key;;
5) clear ; Delete_key;;
6) clear ; show_key ;;
x) exit ;;
*) echo -e "" ; echo "Back To Menu" ; sleep 1 ; menu ;;
esac
