#!/usr/bin/env bash

zypper refresh

zypper install -y vim nano
zypper install -y tree nmap git
zypper install -y neofetch lsb-release

zypper install -y figlet
figlet "Snode 2" > /etc/motd
echo "" >> /etc/motd
echo "Teuton" >> /etc/motd
echo "https://github.com/teuton-software/teuton" >> /etc/motd

echo "# Adding more alias" >> /home/vagrant/.bashrc
echo "alias c='clear'" >> /home/vagrant/.bashrc
echo "alias v='vdir'" >> /home/vagrant/.bashrc

lsb_release -d

