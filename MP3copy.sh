#!/bin/bash

# MP3copy
# Copiar aleatoriamente archivos .mṕ3

# $1 es ubicacion destino
# $2 es numero de archivos a copiar

IFS=$'\n'
CONTAR=0 #Iniciar contador en 0

#Validar que existan parámetros
if [ $# -eq 0 ]; then

	echo -e "
No ha indicado algún parámetro
mp3copy [ubicación destino] [cantidad de archivos a copiar]

Ejecute --help mp3copy para más información
	"

#Validar que $1 sea un directorio
elif [ -d "$1" ]; then
	for file in $( ls *.mp3 | shuf ) #ls aleatorio
	do
	   	let CONTAR=$CONTAR+1 #Incrementar contador en 1

	   	echo "Copiando archivo $CONTAR de $2 | $file " #Mostrar archivo a copiar
		cp $file $1/$file #Copiar archivo a ubicación especificada

		if [ $CONTAR -eq $2 ]; then #Validación del contador
			break #Finalizar copia
		fi
	done

	if [ $CONTAR -eq 0 ]; then  #En caso de no haber un solo archivo
		echo "No se ha encontrado algún archivo para copiar"
	else
		echo "Los archivos copiados fueron: [ $CONTAR ]"
	fi
elif [ $1 = "--version" ];  then #Validar parámetro --help
	echo -e "mp3copy - version 1.0\n"
	echo "Desarrollado y mantenido por: Ignacio Hernández"
fi	