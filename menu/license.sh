#!/bin/bash
green='\033[0;32m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'
yl='\e[32;1m'
bl='\e[36;1m'
gl='\e[32;1m'
rd='\e[31;1m'
mg='\e[0;95m'
blu='\e[34m'
op='\e[35m'
or='\033[1;33m'
bd='\e[1m'
color1='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
#ColorCode===================

key=$(cat /etc/api)
mail=$(cat /etc/gmail)

function regip(){
clear
echo -e ""
echo -e "${CYAN}╒══════════════════════════════════════════════════╕${NC}"
echo -e " \E[41;1;39m                  [ REG IP VPS ]                  \E[0m"
echo -e "${CYAN}╘══════════════════════════════════════════════════╛${NC}"
rm -rf /root/permission
read -p " Input IP VPS : " daftar
echo -e ""
echo -e " [ ${rd}INFO${NC} ] • Checking the IP VPS!"
sleep 2
REQIP=$(curl -sS https://raw.githubusercontent.com/bochil132/permission/main/ipmini | awk '{print $4}' | grep $daftar)
if [[ $daftar = $REQIP ]]; then
echo -e " [ ${rd}INFO${NC} ] • IP VPS Already Registered!!"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
other
else
echo -e " [ ${rd}INFO${NC} ] • OK! IP VPS is not Registered!"
sleep 1
echo -e " [ ${rd}INFO${NC} ] • Lets Register it!"
sleep 3
clear
fi
echo -e "${CYAN}╒══════════════════════════════════════════════════╕${NC}"
echo -e " \E[41;1;39m                  [ REG IP VPS ]                  \E[0m"
echo -e "${CYAN}╘══════════════════════════════════════════════════╛${NC}"
read -p " Client Name : " client
if [ -z $client ]; then
cd
echo -e " [ ${rd}INFO${NC} ] • Please Input client name"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
other
fi

clear
sleep 1
echo -e " [ ${green}OKEY${NC} ] ${mg}•${NC} ApiKey Succesfully Verifikasi"
sleep 1
clear
echo -e ""
echo -e "---------------------------------------------------" | lolcat
echo -e "Format [ ${green}Tahun-Bulan-Tanggal${NC} ]"
echo -e "Contoh Ada Di Bawah :"
echo -e "[ ${rd}2022-01-01${NC} ] 1 Days Bulan 1"
echo -e "[ ${rd}2022-01-30${NC} ] 30 Days Bulan 1"
echo -e "---------------------------------------------------" | lolcat
read -p "Input Exp Date : " exp

sleep 1
exp=$(date -d "$exp days" +"%Y-%m-%d")
hariini=$(date -d "0 days" +"%Y-%m-%d")
git config --global user.email "${mail}" &> /dev/null
git config --global user.name "bochil132" &> /dev/null
git clone https://github.com/bochil132/permission.git &> /dev/null
cd /root/permission/ &> /dev/null
rm -rf .git &> /dev/null
git init &> /dev/null
touch ipmini &> /dev/null
touch newuser &> /dev/null
TEXT="
Name        : $client 
Exp         : $exp 
IPVPS       : $daftar 
Reg Date    : $hariini
" 
echo "${TEXT}" >>/root/permission/newuser 
echo "### $client $exp $daftar" >>/root/permission/ipmini 
git add .
git commit -m register &> /dev/null
git branch -M main &> /dev/null
git remote add origin https://github.com/bochil132/permission.git &> /dev/null
git push -f https://${key}@github.com/bochil132/permission.git &> /dev/null
sleep 1
clear
echo -e "${CYAN} Thanks Your For Our Using Service ${NC}"
echo -e "${CYAN}===================================${NC}"
echo -e "[ ${rd}Note${NC} ] • Success Register IP VPS"
echo -e ""
echo -e "Client Name   : $client"
echo -e "IP VPS        : $daftar"
echo -e "Register Date : $hariini"
echo -e "Expired Date  : $exp"
cd
rm -rf /root/permission
echo -e "${CYAN}===================================${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
other

}

function renip(){
clear
echo -e ""
echo -e "${cyan}╒══════════════════════════════════════════════════╕${NC}"
echo -e " \E[41;1;39m                 RENEW ACCESS SCRIPT              \E[0m"
echo -e "${cyan}╘══════════════════════════════════════════════════╛${NC}"
rm -rf /root/permission
git config --global user.email "${mail}" &> /dev/null
git config --global user.name "bochil132" &> /dev/null
git clone https://github.com/bochil132/permission.git
cd /root/permission/
rm -rf .git
git init
touch ipmini
echo -e "   [ ${green}INFO${NC} ] Checking list.."

NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/root/permission/ipmini")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
  clear
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "            ${red}Please Input Correct Number!${NC}"
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
menu-set
fi
clear
echo -e "${cyan}╒══════════════════════════════════════════════════╕${NC}"
echo -e " \E[41;1;39m                 RENEW ACCESS SCRIPT              \E[0m"
echo -e "${cyan}╘══════════════════════════════════════════════════╛${NC}"
grep -E "^### " "/root/permission/ipmini" | cut -d ' ' -f 2-4 | nl -s '. '
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
  if [[ ${CLIENT_NUMBER} == '1' ]]; then
    read -rp "Select one client [1]: " CLIENT_NUMBER
  else
    read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
  fi
if [ -z $CLIENT_NUMBER ]; then
cd
clear
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "            ${red}Please Input Correct Number!${NC}"
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
other
fi
done
echo -e ""
read -p "Expired (days): " masaaktif
if [ -z $masaaktif ]; then
cd
clear
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "            ${red}Please Input Correct Number!${NC}"
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
other
fi
name1=$(grep -E "^### " "/root/permission/ipmini" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p) #name
exp=$(grep -E "^### " "/root/permission/ipmini" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p) #exp
ivps1=$(grep -E "^### " "/root/permission/ipmini" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p) #ip

now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(((d1 - d2) / 86400))
exp3=$(($exp2 + $masaaktif))
exp4=$(date -d "$exp3 days" +"%Y-%m-%d")
sed -i "s/### $name1 $exp $ivps1/### $name1 $exp4 $ivps1/g" /root/permission/ipmini
git add .
git commit -m renew
git branch -M main
git remote add origin https://github.com/bochil132/permission.git
git push -f https://${key}@github.com/bochil132/permission.git
clear
echo -e "     ${red}Thanks You For Using AutoScript${NC}"
echo -e "${cyan}==========================================${NC}"
echo -e "[ ${red}Note${NC} ] • Client IP Succesfully Renewal"
echo -e ""
echo -e "Renew Date   : $now"
echo -e "IP VPS       : $ivps1"
echo -e "Day Added    : $masaaktif Day"
echo -e "Expired Date : $exp4"
echo -e "Client       : $name1"
echo -e "${cyan}==========================================${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
other
}

function delip(){
clear
rm -rf /root/permission &> /dev/null
git config --global user.email "${mail}" &> /dev/null
git config --global user.name "bochil132" &> /dev/null
git clone https://github.com/bochil132/permission.git &> /dev/null
cd /root/permission/ &> /dev/null
rm -rf .git &> /dev/null
git init &> /dev/null
touch ipmini &> /dev/null
clear
echo -e "${CYAN}╒══════════════════════════════════════════════════╕${NC}"
echo -e " \E[41;1;39m                 [ DELETE IP VPS ]                \E[0m"
echo -e "${CYAN}╘══════════════════════════════════════════════════╛${NC}"
echo -e ""
grep -E "^### " "/root/permission/ipmini" | cut -d ' ' -f 2-4 | nl -s '. '
echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
read -rp "Please Input Number : " nombor
if [ -z $nombor ]; then
cd
clear
echo -e "${CYAN}╒══════════════════════════════════════════════════╕${NC}"
echo -e " \E[41;1;39m                 [ DELETE IP VPS ]                \E[0m"
echo -e "${CYAN}╘══════════════════════════════════════════════════╛${NC}"
echo -e ""
echo -e " [ ${rd}Note${NC} ] • Please Input Correct Number"
echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
other
fi
clear
sleep 1
echo -e "[ ${green}OKEY${NC} ] • ApiKey Succesfully Verifikasi"

name1=$(grep -E "^### " "/root/permission/ipmini" | cut -d ' ' -f 2 | sed -n "$nombor"p) #name
exp=$(grep -E "^### " "/root/permission/ipmini" | cut -d ' ' -f 3 | sed -n "$nombor"p) #exp
ivps1=$(grep -E "^### " "/root/permission/ipmini" | cut -d ' ' -f 4 | sed -n "$nombor"p) #ip
sed -i "s/### $name1 $exp $ivps1//g" /root/permission/ipmini &> /dev/null
hariini2=$(date -d "0 days" +"%Y-%m-%d")
TEXTD="
Thanks Your For Our Using Service
---------------------------------------
Client Name   : $name1
IP VPS        : $ivps1  
Status        : Deleted $hariini2
---------------------------------------" 
echo "${TEXTD}" >>/root/permission/delete
git add . &> /dev/null
git commit -m remove &> /dev/null
git branch -M main &> /dev/null
git remote add origin https://github.com/bochil132/permission.git &> /dev/null
git push -f https://${key}@github.com/bochil132/permission.git &> /dev/null
clear
echo -e "${CYAN} Thanks Your For Our Using Service ${NC}"
echo -e "${CYAN}===================================${NC}"
echo -e "[ ${rd}Note${NC} ] • Success Deleted IP VPS"
echo -e ""
echo -e "IP VPS       : $ivps1"
echo -e "Expired Date : $exp"
echo -e "Client Name  : $name1"
cd
rm -rf /root/permission
echo -e "${CYAN}===================================${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
other
}
clear
echo -e ""
clear
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
echo -e "\E[44;1;39m                 ⇱ OTHER MENU ⇲                   \E[0m"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
echo -e " ${rd}1${NC} • Register Add IP"
echo -e " ${rd}2${NC} • Register Renew IP"
echo -e " ${rd}3${NC} • Register Delete IP"
echo -e ""
echo -e " ${rd}0.${NC} Back To Menu •••"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
echo -e ""
read -p "Input Your Choose : "  opt
echo -e   ""
case $opt in
01 | 1) clear ; regip ;;
02 | 2) clear ; renip ;;
03 | 3) clear ; delip ;;
#04 | 4) clear ; port80 ;;
#05 | 5) clear ; port8880 ;;
#06 | 6) clear ; stopall ;;
#07 | 7) clear ; startall ;;
00 | 00) clear ; menu ;;
*) clear ; menu-set ;;
esac

       
