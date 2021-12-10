#!/bin/bash
echo "[INFO] Install rails v1"

echo "[INFO] Installing tools..."
zypper --non-interactive in vim tree nmap git

echo "[INFO] Installing rails..."
zypper --non-interactive --quiet in gcc make kernel-devel ruby-devel

echo "[INFO] Installing sqlite3..."
zypper --non-interactive in sqlite3 sqlite3-devel
zypper --non-interactive --quiet in gcc gcc10-c++
ln -s /usr/bin/gcc-10 /usr/bin/g++
gem install mini_racer -v 0.4.0
echo "alias rails='rails.ruby2.5'" >> /home/vagrant/.alias
