# PostgresQL Lesueur-Loire-Dubuis

## Cloner le dépôt git sur sa machine
Il faut d'abord aller dans le dossier voulu, et avoir installer git au préalable.   
Ensuite il suffit de lancer la commande suivante :    
`git clone https://github.com/tentacode-classroom/postgresql_-2017-03-07-cedric-romain.git`

Pour la suite des commandes il est mieux de se trouver à la racine du dossier :      
`cd postgresql_-2017-03-07-cedric-romain`   

###### ***N.B: Toutes les commandes suivantes sont lancées à partir de la racine du projet. Si vous voulez les lancer à partir du dossier '/scripts' par exemple, il suffira d'enlever '/scripts' aux commandes.***

Si l'une des commandes ne marche pas à cause de PostgreSQL :  
Relancer/Lancer le service avec :  
`sudo service postgresql restart`

## Ordre des commandes à effectuer pour l'installation et l'insertion complète des tables

### Installation de PostgreSQL
Exécutez le script suivant :    

`./scripts/install_psql.sh`    

Ce script va allez chercher le repo, installer postgresQL puis le lancer.

### Configuration de PostgreSQL
`./scripts/config_psql.sh`

### Importation des données venant de github
Pour récurperer les événements de GitHub du 7 Mars 2017, on va télécharger ces dossiers depuis github archives et les extraire, puis les concaténer dans data.json à la racine du projet :   

`./scripts/import_data.sh`

### Création des utilisateurs
`./scripts/create_users.sh`

### Création des tables de données
Créations de la table 'events_raw' et insertion des données à l'intérieur de celle-ci :    

`./scripts/populate_events_raw.sh`

Créations des tables 'actor', repository', 'event', 'push_event' et 'issue_event', et insertion des données :    

`./scripts/populate_events.sh`

### Création des views
Pour créer les views il suffit de lancer la commander suivante : 
`./scripts/create_views.sh`

## Sauvegarde et restoration des données

### Sauvegarde
Pour sauvegarder les rôles et les tables, il suffit de lancer la commande :    
`./scripts/save_backups.sh`
Cela créera un dossier backups à la racine du projet.

### Restoration
Pour restorer les rôles et les tables, il suffit de lancer la commande :    
`./scripts/restore_backups.sh`

