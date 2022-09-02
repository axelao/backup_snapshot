#!/bin/bash

#Author: Axel Danieles
#Email: axel.danieles@gmail.com

####################################################INSTALL CORE APPS ON DEBIAN################################################################

#1 - Install Compose on Linux
echo "Install main apps"
sudo apt install -y \
    nmap vim tcpdump iftop htop \
    samba samba-common samba-common-bin \
    cifs-utils ntfs-3g lshw \
    curl dfc git

echo "Add conf on smb.conf"
sudo cat conf/samba.txt >> /etc/samba/smb.conf
sudo systemctl stop smbd
sudo systemctl start smbd

echo "Change configfile SSH"
sudo mv conf/sshd_config /etc/ssh/
sudo systemctl restart ssh

echo "Create dir on /mnt"
sudo mkdir /mnt/Backup
