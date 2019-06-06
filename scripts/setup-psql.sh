#!/bin/bash

echo "deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main" | sudo tee --append /etc/apt/sources.list.d/pgdg.list #Rajoute la ligne nécessaire aux téléchargement dans le fichier pgdg.list

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - #Télécharge la clé utile pour la suite

sudo apt-get update #Lance un update

sudo apt-get install postgresql-11 -y #Installe le paquet psql version 11

psql --version #Montre la version de psql dans le cas où le paquet est bien installé
