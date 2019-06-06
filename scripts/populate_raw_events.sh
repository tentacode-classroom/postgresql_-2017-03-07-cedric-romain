#!/bin/bash

#Lance le script dans le dossier sql
sudo -u postgres psql -f ./../sql/populate_raw_events.sql
