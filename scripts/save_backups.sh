#!/bin/bash

#set CURRENT_DIRECTORY variable
CURRENT_DIRECTORY=`dirname $0`
CURRENT_DIRECTORY=$CURRENT_DIRECTORY/..

rm -rf $CURRENT_DIRECTORY/backups
mkdir $CURRENT_DIRECTORY/backups

#Backup de gitevents
pg_dump --username=super_admin gitevents -f $CURRENT_DIRECTORY/backups/backup_gitevents.sql

#Backup des roles
pg_dumpall --roles-only --username=super_admin -f $CURRENT_DIRECTORY/backups/backup_roles.sql
