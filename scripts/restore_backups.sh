#!/bin/bash

#set CURRENT_DIRECTORY variable
CURRENT_DIRECTORY=`dirname $0`
CURRENT_DIRECTORY=$CURRENT_DIRECTORY/..

#Restoration de gitevents et des roles
psql --username=super_admin -f $CURRENT_DIRECTORY/backups/backup_gitevents.sql
psql --username=super_admin -f $CURRENT_DIRECTORY/backups/backup_roles.sql
