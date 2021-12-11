#!/bin/bash
echo "[INFO] Install rails into VM"

echo "[INFO] Installing tools..."
zypper --non-interactive --quiet in vim tree git

echo "[INFO] Installing rails..."
zypper --non-interactive --quiet in gcc make ruby-devel
zypper --non-interactive --quiet in ruby2.5-rubygem-rails-5.2
echo "alias rails='rails.ruby2.5'" >> /home/vagrant/.alias
# zypper --non-interactive --quiet in gcc gcc10-c++ kernel-devel

echo "[INFO] Installing sqlite3..."
zypper --non-interactive --quiet in sqlite3 sqlite3-devel
# ln -s /usr/bin/gcc-10 /usr/bin/g++
# gem install mini_racer -v 0.4.0
