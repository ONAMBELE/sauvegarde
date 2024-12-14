#/bin/bash

#Sauvegarde complete
#	Cette fonction prends en parametres le chemin vers le repertoire R1 à sauvegarder, le lien/adresse vers le serveur distant et le chemin du repertoire de la sauvegarde sur le serveur distant


# -z pour la compression durant le transfert
# -a preserver les liens, droits et metadonnées
# -e permet de se connecter au serveur distant
# -i pour specifier un chemin


function complete_save(){
	rsync -avz --force -e "ssh -i ~/.ssh" $1 $2:$3
}

complete_save $1 $2 $3

