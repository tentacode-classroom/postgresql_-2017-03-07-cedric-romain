rm -rf ../backups
mkdir ../backups

#Backup de gitevents
pg_dump --username=super_admin gitevents -f ../backups/backup_gitevents.sql

#Backup des roles
pg_dumpall --roles-only --username=super_admin -f ../backups/roles.sql
