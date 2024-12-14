#/bin/bash
#	Comme le script de sauvegarde complete, ce script predra en parametres: le chemin 
#vers le repertoire R1 à sauvegarder, le lien/adresse vers le serveur distant et 
#le chemin du repertoire de la sauvegarde sur le serveur distant enfin de realiser une synchronisation et enfin nous procedons à la suppression
#


choix=0

./script_sauvegarde_diff.sh $1 $2 $3 #Synchronisation des fichiers dans le repertoire distant avec rsync

ssh -i ~/.ssh/id_rsa $2 "find $3 -type f -mtime +7 -exec rm -f {} \;"

echo -e "\n\n";

read  -p "a) Les sauvegardes différentielles âgées de plus de 7 jours.
b) Les sauvegardes hebdomadaires (complètes du dimanche) âgées de plus de 4 semaines.
c) Les sauvegardes mensuelles âgées de plus de 6 mois.
    " choix

case $choix in

    "a")echo -e "\n" 
        ssh -i ~/.ssh/id_rsa $2 "find $3 -type f -mtime +7 -exec rm -f {} \;"
        echo -e "\n" ;;
    
    "b")echo -e "\n"  
        ssh -i ~/.ssh/id_rsa $2 "find $3 -type f -mtime +28 -exec rm -f {} \;"
        echo -e "\n" ;;
    
    "c")echo -e "\n"  
        ssh -i ~/.ssh/id_rsa $2 "find $3 -type f -mtime +180 -exec rm -f {} \;"
        echo -e "\n" ;;
esac

