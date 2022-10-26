#!/usr/bin/env bash

ping 192.168.1.1 -c 1 > /dev/null
echo $?
ping 192.168.16.16 -c 1 > /dev/null
echo $?
