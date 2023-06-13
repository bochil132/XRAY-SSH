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

#/ Start Limit Speed
function start(){
clear
echo -e "${O}
 Example :
 1024 For 1 Mbps
 2048 For 2 Mbps${NC}
"
read -p "Input Limit Download : " down
sleep 0.1
read -p "Input Limit Upload   : " up
wondershaper -a eth0 -d $down -u $up
sleep 1
clear
echo -e "${yl}Limit Speed Server Success Started.!!${NC}"
echo ""
read -n 1 -s -r -p "Enter to back.!!"
limit
}

#/ Stop Limit Speed
function stop(){
clear
echo -e "
Processing... stop limit speed"
sleep 1
echo "1"
sleep 1
echo "2"
sleep 1
echo "3"
sleep 3
clear
wondershaper -c -a eth0
echo -e "${y}Successfuly.. stop limit speed${NC}"
echo ""
read -n 1 -s -r -p "Enter to back.!!"
limit
}

#/ Change Limit Spees
function edit(){
clear
wondershaper -c -a eth0
echo -e "${O}
 Example :
 1024 For 1 Mbps
 2048 For 2 Mbps${NC}
"
read -p "Change Limit Download : " down_change
sleep 0.1
read -p "Change Limit Upload   : " up_change
sleep 0.5
wondershaper -a eth0 -d $down_change -u $up_change
sleep 2
clear
echo -e "${yl}Change Limit Speed Successfully.!!${NC}"
echo ""
read -n 1 -s -r -p "Enter to back.!!"
limit
}
#//
clear
limit_down=$(cat /etc/limit_download.txt)
limit_up=$(cat /etc/limit_upload.txt)
echo -e "
${C}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}
${multi}               • LIMIT SPEED SERVER •              ${NC}
${C}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}
 ${O}~ Limit Download :${NC} $limit_down
 ${O}~ Limit Upload   :${NC} $limit_up"
echo -e "
 ${rd}1.)${NC} Start Limit Speed Server
 ${rd}2.)${NC} Stop Limit Speed Server
 ${rd}3.)${NC} Change Limit Speed Server"
echo -e "
 ${yl}Please select start, so that the following
 text disappears (no such file or directory)${NC}
${C}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo "Tap enter to go back menu"
echo ""
read -p "Select Options : " limit_select
echo -e ""
case $limit_select in
1)
start
;;
2)
stop
;;
3)
edit
;;
*)
echo -e "" ; sleep 1 ; menu
esac

