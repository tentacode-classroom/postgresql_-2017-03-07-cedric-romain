# PostgresQL Lesueur-Loire-Dubuis

## Cloner le dépôt git sur sa machine
Il faut d'abord aller dans le dossier voulu, et avoir installer git au préalable.
Ensuite il suffit de lancer la commande suivante :
`git clone https://github.com/tentacode-classroom/postgresql_-2017-03-07-cedric-romain.git`

Pour la suite des commandes il est mieux de se trouver à la racine du dossier : \n
`cd postgresql_-2017-03-07-cedric-romain`

### Installation de PostgreSQL
Exécutez le script suivant

`./scripts/install_psql.sh` 

Ce script va allez chercher le repo, installer postgresQL puis le lancer.

## Configuration de PostgreSQL
`./scripts/config_psql.sh`

## Importation des données venant de github
Pour récurperer les événements de GitHub du 7 Mars 2017, on va télécharger ces dossiers depuis github archives et les extraire, puis les concaténer dans data.json à la racine du projet 

`./scripts/import_data.sh`

## Création des utilisateurs
`./scripts/create_users.sh`

## Création des tables de données
Créations de la table 'events_raw' et insertion des données à l'intérieur de celle-ci

`./scripts/populate_events_raw.sh`

Créations des tables 'actor', repository', 'event', 'push_event' et 'issue_event'

`./scripts/populate_events.sh`


