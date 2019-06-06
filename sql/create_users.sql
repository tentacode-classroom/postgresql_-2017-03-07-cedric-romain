--Supprime les différents utilisateurs/tables si elle existent déjà 
DROP DATABASE IF EXISTS super_admin;
DROP ROLE IF EXISTS super_admin;
DROP ROLE IF EXISTS gitevents;

--Créé un utilisateur 'super_admin' avec '12345' en tant que mdp, et dont le rang est 'SUPERUSER' 
CREATE ROLE super_admin LOGIN PASSWORD '12345' SUPERUSER;
--Créé la bdd 'super_admin' dont le propriétaire est 'super_admin'
CREATE DATABASE super_admin OWNER super_admin;

--Créé un utilisateur 'gitevents' avec '12345' en tant que mdp
CREATE ROLE gitevents LOGIN PASSWORD '12345';
--Créé la bdd 'gitevents' dont le propriétaire est 'gitevents'
ALTER DATABASE gitevents OWNER TO gitevents;
