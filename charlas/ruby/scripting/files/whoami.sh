#/usr/bin/env bash

# SI poner espacios es un problema de sintaxis: name = $(whoami)
name=$(whoami)         
rol=$1 

# NO poner espacios es un problema de sintáxis: if [$name == 'root']
# NO poner espacios es un problema de semántica: if [ $name=='root' ]
if [ $name == 'root' ] 
then
  echo "root is not valid user!"
  exit 1
fi

echo "[$rol] My name is $name"
exit 0

