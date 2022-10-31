#!/usr/bin/env bash
# Variables del script
CURSO="curso1920"
MODULOS="hardware ingles lenguaje-de-marcas sistemas-operativos redes"
ALUMNO="obiwan"

# Comienza el script
echo "[INFO] Ejecutando el ejercicio 04..."

mkdir $CURSO

for I in $MODULOS; do
  # Esto es lo que se repite
  FOLDER=$CURSO/$I
  mkdir $FOLDER
  echo $ALUMNO > $FOLDER/leeme.txt
done
