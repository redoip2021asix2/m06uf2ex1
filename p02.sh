#!/bin/bash
#Renato Dominguez Iparraguirre
clear

if (( EUID != 0 ))
then
  echo "Aquest script s'ha d'executar amb prilegis de l'usuari root"
  exit 3 
fi

if [[ ! -d /var/$1 ]]
then
	echo -n "El directori no existeix. Vols crear-la (s/n)?: "
	read opc
	if [[ $opc != "s" ]] && [[ $opc != "S" ]]
	then
		echo "No es crearà el directori indicat"	
	else
		mkdir /var/$1
		echo "S'ha creat el directori demanat i a continuació es crearà la còpia de seguretat"
	fi
fi
nom_backup=/var/$1/sshd.config.backup.
nom_backup=/var/$1/cups.conf.backup.
cp /etc/ssh/sshd_config $nom_backup
cp /etc/cups/cups.conf $nom_backup
echo "S'ha creat la còpia de seguretat"
echo -n "Vols continuar (s/n)?: "
	read opc
	if [[ $opc != "s" ]] && [[ $opc != "S" ]]
	then
	return 
exit 5
