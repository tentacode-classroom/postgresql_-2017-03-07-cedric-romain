#!/bin/bash

#set CURRENT_DIRECTORY variable
CURRENT_DIRECTORY=`dirname $0`
CURRENT_DIRECTORY=$CURRENT_DIRECTORY/..

#Delete  files
rm -Rf $CURRENT_DIRECTORY/imports
rm -Rf $CURRENT_DIRECTORY/data.json

#Télécharge les json compressés
echo "Téléchargement des données en cours..."
wget --quiet -P $CURRENT_DIRECTORY/imports https://data.gharchive.org/2017-03-07-{0..1}.json.gz

#Décompresse les dossiers json
echo "Décompression des données en cours..."
gzip -d $CURRENT_DIRECTORY/imports/2017-03-07-{0..1}.json.gz
echo "Décompression terminée."

#Concatène les fichier json en un seul fichier
cat $CURRENT_DIRECTORY/imports/* > $CURRENT_DIRECTORY/data.json

#Supprime le dossier imports
rm -Rf $CURRENT_DIRECTORY/imports

