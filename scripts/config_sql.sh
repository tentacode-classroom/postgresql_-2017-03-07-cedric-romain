#!/bin/bash

CURRENT_DIRECTORY=`dirname $0` #Variable de dossier actuel

sudo -u postgres psql -f $CURRENT_DIRECTORY/../sql/confpostgre.sql #Lance le script de configuration de psql dans le dossier sql

sudo service postgresql restart #Redémarre le service psql



