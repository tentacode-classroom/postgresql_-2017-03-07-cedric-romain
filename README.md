PostgresQL Dubuis-Loire-Lesueur
Instalation de PostgresQL
Exécutez le script suivant

./setup_postresql.sh 


Ce script va allez chercher le repo, installez postgresQL puis le lancer.

Importation du Json venant de github


Ensuite pour récurperer les evenements de GitHub du 7 Mars 2017 de 0h, on va le télécharger et l'extraire, puis le deplacer dans /json

./import_github.sh

Création des tables de données
Créations table, actor, repo, events, push_events

./create_event_database

Configuration de postgresQL
Changemement sur le port 1234 et ajout de la memoire de travail sur 128Mb

./update_configuration
