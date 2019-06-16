#!/bin/bash

#set CURRENT_DIRECTORY variable
CURRENT_DIRECTORY=`dirname $0`
CURRENT_DIRECTORY=$CURRENT_DIRECTORY/..
if [ -d "$CURRENT_DIRECTORY/backups" ]; then
    #Restoration de gitevents et des roles
    psql --username=super_admin -f $CURRENT_DIRECTORY/backups/backup_gitevents.sql
    psql --username=super_admin -f $CURRENT_DIRECTORY/backups/backup_roles.sql
else
    echo "No backups found";
    echo "Please run ./save_backups.sh before using this command";
fi
