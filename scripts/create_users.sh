#!/bin/bash

#set CURRENT_DIRECTORY variable
CURRENT_DIRECTORY=`dirname $0`
CURRENT_DIRECTORY=$CURRENT_DIRECTORY/..

#Lance le script sql présent dans le dossier sql
sudo -u postgres psql -f $CURRENT_DIRECTORY/sql/create_users.sql

