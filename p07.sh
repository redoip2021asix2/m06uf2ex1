#!/bin/bash
#Renato Dominguez Iparraguirre
clear

if (( EUID != 0 ))
then
  echo "Aquest script s'ha d'executar amb prilegis de l'usuari root"
  exit 3 
fi
read -p "Dime un directorio: " directorio
if [ -a $directorio]
then
    echo "El directorio existe i a continuación se creará la copia de seguridad"
    cp $directorio /mnt/$directorio.$(date +20%y%m%d%H%M)
    return 0
    else 
    echo "El directorio no existe"
    return 1
