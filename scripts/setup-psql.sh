#!/bin/bash

#Rajoute la ligne nécessaire aux téléchargement dans le fichier pgdg.list
echo "deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main" | sudo tee --append /etc/apt/sources.list.d/pgdg.list

#Télécharge la clé utile pour la suite
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

#Lance un update
sudo apt-get update

#Installe le paquet psql version 11
sudo apt-get install postgresql-11 -y

#Montre la version de psql dans le cas où le paquet est bien installé
psql --version
