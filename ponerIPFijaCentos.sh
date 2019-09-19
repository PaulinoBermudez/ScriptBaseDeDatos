#!/bin/sh

# Poner IP fija en Centos 7

sudo nano -c /etc/sysconfig/network-scripts/ifcfg-enp0s3 <<EOF
BOOTPROTO=static
ONBOOT=yes
IPADDR=10.1.0.95
GATEWAY=10.1.0.1
DNS1=8.8.8.8
DNS2=8.8.4.4
EOF

systemctl stop NetworkManager
systemctl disable NetworkManager
systemctl restart network.service