#!/bin/bash
#Renato Dominguez Iparraguirre
clear

if (( EUID != 0 ))
then
  echo "Aquest script s'ha d'executar amb prilegis de l'usuari root"
  exit 4 
fi

echo -n "Dóna el nombre d'usuaris que es vol crear (MÍN=1 MÀX=9999): "
read n_usr
if (( $n_usr < 1 )) || (( $n_usr > 9999 ))
then
	echo "Nombre incorrecte d'usuaris"
	exit 1
fi
echo -n "Dóna un nom base pels usuaris: "
read nom_base
echo "LLISTA D'USUARIS" > /root/$nom_base.txt
if (( $? != 0 ))
	then
		echo "Problema creant el fitxer d'usuaris i contrasenyes"
		exit 3
	fi
echo "Format de la llista: Nom d'usuari  Contrasenya" >> /root/$nom_base.txt
for (( num=1; num<=$n_usr; num++ )) 
do
	ctsnya=$(pwgen 8 1)
	nom_usr=$nom_base$num@fje
	echo "$nom_usr  $ctsnya" >> /root/$nom_base.txt
done

exit 0
