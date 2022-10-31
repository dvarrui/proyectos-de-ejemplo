#!/usr/bin/env bash

# Variables del script
CURSO="curso1920"
MODULOS="hardware ingles lenguaje-de-marcas sistemas-operativos redes"

# Comienza el script
echo "[INFO] Ejecutando $(basename $0 .sh)..."
echo -n "Escribe el nombre del ALUMNO: "
read ALUMNO

# Borrar el directorio si existe
if [ -d $CURSO ]
then
  rm -r $CURSO
fi

mkdir $CURSO

# Esto es lo que se repite
for I in $MODULOS
do
  FOLDER=$CURSO/$I
  mkdir $FOLDER
  echo $ALUMNO > $FOLDER/leeme.txt
done
