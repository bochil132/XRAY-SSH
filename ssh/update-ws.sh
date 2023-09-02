#!/bin/bash
clear
sleep 1
rm -f /usr/local/bin/ws-tls
rm -f /usr/local/bin/ws-nontls
rm -f /usr/local/bin/ws-ovpn
wget -q -O /usr/local/bin/ws-tls https://stn-cloud.my.id/python/ws-tls
chmod +x /usr/local/bin/ws-tls
wget -q -O /usr/local/bin/ws-ovpn https://stn-cloud.my.id/python/ws-ovpn.py
chmod +x /usr/local/bin/ws-ovpn
wget -q -O /usr/local/bin/ws-nontls https://stn-cloud.my.id/python/websocket.py
chmod +x /usr/local/bin/ws-nontls
sleep 0.1
systemctl restart ws-tls
systemctl restart ws-nontls
systemctl restart ws-ovpn
rm ws.sh