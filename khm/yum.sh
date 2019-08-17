#!/bin/bash
read -p "输入你的主机名:" a 
hostnamectl set-hostname $a
read -p "输入你的网卡名:" b
read -p "输入你ipv4地址:" c
nmcli connection modify $b ipv4.method manual ipv4.addresses "$c"/24 connection.autoconnect yes
nmcli connection up $b 
echo " [dvd]
name=dvd
baseurl="ftp://192.168.4.254/centos-1804"
enabled=1
gpgcheck=0" > /etc/yum.repos.d/dvd.repo
