#!/bin/bash

#Variable de dossier actuel
CURRENT_DIRECTORY=`dirname $0`

#Lance le script de configuration de psql dans le dossier sql
sudo -u postgres psql -f $CURRENT_DIRECTORY/../sql/confpostgre.sql

#Redémarre le service psql
sudo service postgresql restart



