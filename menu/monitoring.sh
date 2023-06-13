#!/bin/bash

#color code
export NC='\033[0m'
export multi='\E[41;1;39m'
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

function 5m(){
clear
vnstat -5
echo ""
read -n 1 -s -r -p "Enter to back.!!"
monitorbw
}

function hours(){
clear
vnstat -h
echo ""
read -n 1 -s -r -p "Enter to back.!!"
monitorbw
}

function day(){
clear
vnstat -d
echo ""
read -n 1 -s -r -p "Enter to back.!!"
monitorbw
}

function month(){
clear
vnstat -m
echo ""
read -n 1 -s -r -p "Enter to back.!!"
monitorbw
}

# RX = Download
# TX = Upload

clear
tx_now="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
rx_now="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
echo -e "
${C}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}
${multi}             • BANDWIDTH MONITORING •            ${NC}
${C}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}
 ${O}~ Today RX :${NC} $rx_now
 ${O}~ Today TX :${NC} $tx_now"
echo -e "
 ${rd}1.)${NC} Check Usage After 5 Minutes
 ${rd}2.)${NC} Check Usage After 1 Hours
 ${rd}3.)${NC} Check Usage After 1 Days
 ${rd}4.)${NC} Check Usage After 1 Month
"
echo -e "${C}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo " Tap enter to go back"
echo ""
read -p " Select Options : " select_number
echo -e ""
case $select_number in
1)
5m
;;
2)
hours
;;
3)
day
;;
4)
month
;;
*)
echo -e "" ; sleep 1 ; monitorbw
esac