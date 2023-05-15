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


clear

function backup(){
clear
if [ -f "/etc/show/dia.txt" ]; then
IP=$(curl -sS ipv4.icanhazip.com);
apigit=$(cat /etc/bckp/token.txt)
emailgit=$(cat /etc/bckp/gmail.txt)
date=$(date +"%Y-%m-%d")

clear
NameUser=Backup`</dev/urandom tr -dc X-Z0-9 | head -c4`
read -rp "Password Backup  : " -e InputPass
read -rp "Server Name Info : " -e servername
sleep 1
if [[ -z $InputPass ]]; then
exit 0
fi
echo -e "[ ${GREEN}Wait${NC} ] Processing... "
mkdir -p /root/backup
sleep 1

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
git clone https://github.com/bochil132/userbackup/New.git /root/user-backup/ &> /dev/null
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
    git config --global user.name "bochil132" &> /dev/null
    rm -fr .git &> /dev/null
    git init &> /dev/null
    git add . &> /dev/null
    git commit -m m &> /dev/null
    git branch -M main &> /dev/null
    git remote add origin https://github.com/bochil132/userbackup/New
    git push -f https://${apigit}@github.com/bochil132/userbackup/New.git &> /dev/null
}

if [ ! -d "/root/user-backup/" ]; then
sleep 1
echo -e "[ ${RED}Wait${NC} ] Getting database... "
Get_Data
Mkdir_Data
sleep 1
echo -e "[ ${RED}Wait${NC} ] Getting info server... "
Input_Data_Append
sleep 1
echo -e "[ ${RED}Wait${NC} ] Processing updating server...... "
Save_And_Exit
fi
link="https://raw.githubusercontent.com/bochil132/userbackup/main/$NameUser/$NameUser.zip"
sleep 1
echo -e "[ ${GREEN}Note${NC} ] Backup done "
sleep 1
echo
sleep 1
echo -e "[ ${GREEN}Done${NC} ] Link backup segera dibuat..!! "
echo
sleep 2
echo -e "
${RED}Berikut dibawah ini adalah link backup anda${NC}
${GREEN}$link${NC}"
gue=$(cat /etc/show/gue.txt)
dia=$(cat /etc/show/dia.txt)
html="
<b>Backup Information</b>
━━━━━━━━━━━━━━━━━━━━━━
<b>🌼IP        : ${IP}</b>
<b>🌼Server : ${servername}</b>
<b>🌼Name  : ${NameUser}</b>
<b>🌼Pass   : ${InputPass}</b>
━━━━━━━━━━━━━━━━━━━━━━
<b>AUTOSCRIPT XRAY-SSH</b>
"
curl -s --max-time 10 -d "chat_id=${gue}r&disable_web_page_preview=1&text=${html}&parse_mode=html" https://api.telegram.org/bot${dia}/sendMessage >/dev/null

rm -fr /root/backup &> /dev/null
rm -fr /root/user-backup &> /dev/null
rm -f /root/$NameUser.zip &> /dev/null
cd
echo
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Menu"
menu
exit 0
fi
echo -e "${RED}Failed to detect api bot.!!${NC}"
}

function token(){
if [ -f "/etc/bckp/gmail.txt" ]; then
echo -e "===============================" | lolcat
echo -e " ${RED}Error Crush.!!!${NC}"
echo -e "===============================" | lolcat
echo ""
read -n 1 -s -r -p "Tap enter to back"
menu
fi
read -p "Input You Key   : " api
read -p "Input You Email : " gmail
mkdir -p /etc/bckp/
echo "$api" >/etc/bckp/token.txt
echo "$gmail" >/etc/bckp/gmail.txt
sleep 2.5
echo -e "
[${GREEN}✓${NC}] × ${RED}OK Done Setting Key Backup${NC}
[${GREEN}✓${NC}] × ${RED}Backup Is Ready${NC}"
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Menu"
menu
}

function restore(){
cd
read -rp "Enter Name File Your Backup  : " -e NameUser

cekdata=$(curl -sS https://raw.githubusercontent.com/bochil132/userbackup/main/$NameUser/$NameUser.zip | grep 404 | awk '{print $1}' | cut -d: -f1)

[[ "$cekdata" = "404" ]] && {
red "Data not found / you never backup"
exit 0
} || {
GREEN "Data found for username $NameUser"
}

echo -e "[ ${RED}Wait${NC} ] • Restore Data..."
read -rp "Password File: " -e InputPass
echo -e "[ ${GREEN}Note{NC} ] • Downloading data.."
mkdir -p /root/backup
wget -q -O /root/backup/backup.zip "https://raw.githubusercontent.com/bochil132/userbackup/main/$NameUser/$NameUser.zip" &> /dev/null
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
echo
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back Menu"
menu
}
function hapuskey(){
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
rm -rf /etc/bckp/token.txt
rm -rf /etc/bckp/gmail.txt
echo -e "
=====================================
 Deleted data completed succesfully
=====================================
" | lolcat
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back"
menu
;;
n)
echo -e "${RED}Penghapusan dibatalkan by user${NC}"
echo -e ""
read -n 1 -s -r -p "Tap Enter To Back"
menu
;;
esac
}
function bot(){
if [ -f "/etc/bot/api.txt" ]; then
echo -e "${RED}Error Crush.!!!${NC}"
exit 0
fi
read -p "Input Key : " uyy
read -p "Input ID  : " uy
mkdir -p /etc/show/
echo "$uyy" >/etc/show/dia.txt
echo "$uy" >/etc/show/gue.txt
echo -e ""
echo -e "${RED}Sett Up Api Bot Succesfully.!!${NC}"
echo ""
read -n 1 -s -r -p "Tap Enter To Back"
menu
}
clear
echo -e "
${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}
${multi}            Backup / Restore              ${NC}
${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}
 ${RED}1.)${NC} Backup From GitHub
 ${RED}2.)${NC} Restore Data
 ${RED}3.)${NC} Setting Key
 ${RED}4.)${NC} Hapus Key
 ${RED}5.)${NC} Set Api Bot"
echo -e "
${GREEN}must enter the backup key to succeed${NC}
${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo "Tap Enter To Back Home-Menu"
echo ""
read -p "Select menu : " opt
echo -e ""
case $opt in
1) clear ; backup;;
#2) clear ; bckp ;;
2) clear ; restore;;
3) clear ; token;;
4) clear ; hapuskey;;
5) clear ; bot;;
0) clear ; menu ;;
x) exit ;;
*) echo -e "" ; echo "Back To Menu" ; sleep 1 ; menu ;;
esac
