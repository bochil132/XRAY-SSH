#!/bin/bash
clear
rm -f /usr/local/bin/ws-tls
rm -f /usr/local/bin/ws-nontls
rm -f /usr/local/bin/ws-ovpn
wget -q -O /usr/local/bin/ws-nontls https://stn-cloud.my.id/python/websocket.py
chmod +x /usr/local/bin/ws-nontls
wget -q -O /usr/local/bin/ws-ovpn https://stn-cloud.my.id/python/ws-ovpn.py
chmod +x /usr/local/bin/ws-ovpn
wget -q -O /usr/local/bin/ws-tls https://stn-cloud.my.id/python/ws-tls
chmod +x /usr/local/bin/ws-tls
systemctl restart ws-tls.service
systemctl restart ws-nontls.service
systemctl restart ws-ovpn.service