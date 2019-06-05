#!/bin/bash

if [ -d ../data ];
then
	rm -rf ../data
	echo "Création du dossier data."
	mkdir ../data
fi

#set CURRENT_DIRECTORY variable
CURRENT_DIRECTORY=`dirname $0`
CURRENT_DIRECTORY=$CURRENT_DIRECTORY/..

#Delete  files
rm -Rf $CURRENT_DIRECTORY/imports
rm -Rf $CURRENT_DIRECTORY/data


echo "Téléchargement des données en cours..."
wget --quiet -P ../imports https://data.gharchive.org/2017-03-07-{0..1}.json.gz

echo "Décompression des données en cours..."
gzip -d ../imports/2017-03-07-{0..1}.json.gz

echo "Décompression terminée."

cat $CURRENT_DIRECTORY/imports/* > $CURRENT_DIRECTORY/data

rm -Rf $CURRENT_DIRECTORY/imports

