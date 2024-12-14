#/bin/bash

#	Comme le script de sauvegarde complete, ce script predra en parametres: le chemin vers le repertoire R1 à sauvegarder, le lien/adresse vers le serveur distant et le chemin du repertoire de la sauvegarde sur le serveur distant


function diff_save(){
	rsync -avzd -e "ssh -i ~/.ssh" $1 $2:$3
}

diff_save $1 $2 $3


echo "* 12 * * 1,2,3,4,5,6 $chemin" > crontab.txt;
crontab crontab.txt;

crontab -l;
rm -v ./crontab.txt








