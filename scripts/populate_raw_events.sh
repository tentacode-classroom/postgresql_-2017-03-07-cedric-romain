#!/bin/bash

#set CURRENT_DIRECTORY variable
CURRENT_DIRECTORY=`dirname $0`
CURRENT_DIRECTORY=$CURRENT_DIRECTORY/..

#Lance le script dans le dossier sql
sudo -u postgres psql -f $CURRENT_DIRECTORY/sql/populate_raw_events.sql
