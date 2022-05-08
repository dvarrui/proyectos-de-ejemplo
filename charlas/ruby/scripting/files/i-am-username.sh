#/usr/bin/env bash

name=$(whoami)         # Los espacios son un problema! name = $(whoami)
folder=$(pwd)

if [ $name=='root' ] # Los espacios son un problema! if [$name=='root']
then
  echo "root is not valid user!"
  exit 1
fi

echo "My name is $name"
echo "My current folder is $folder"

