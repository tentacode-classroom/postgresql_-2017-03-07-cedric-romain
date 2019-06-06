#!/bin/bash

#Lanc le script sql présent dans le dossier sql
sudo -u postgres psql -f ./../sql/create_event_database.sql
