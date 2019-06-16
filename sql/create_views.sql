--Connexion à la bd gitevents
\connect gitevents

--Supprime les views 'freqOpened', 'totalIssue', 'totOpened' et 'howManyMaster' si elles existent déjà
DROP VIEW IF EXISTS freqOpened CASCADE;
DROP VIEW IF EXISTS totalIssue;
DROP VIEW IF EXISTS totOpened;
DROP VIEW IF EXISTS howManyMaster;

--Création des différentes views basées sur la table 'issue_event'
CREATE VIEW totalIssue AS SELECT count(*) AS total FROM issue_event;
CREATE VIEW totOpened AS SELECT count(*) AS opened from issue_event WHERE action='opened';
CREATE VIEW freqOpened AS SELECT round((opened::decimal / total::decimal)*100, 2) AS fréquence_issues_opened  FROM totalIssue, totOpened;

--Création des différentes views basées sur la table 'push_event'
CREATE VIEW howManyMaster AS SELECT count(*) AS master_push_quantity FROM push_event WHERE branch_name LIKE '%/master';

--Renvoie le résultat de la view 'freqOpened' qui est la fréquence de issue ouverte (en %)
SELECT * FROM freqOpened;

--Renvoie le résultat de la view 'howManyMaster' qui est la de push exécutés sur la branch master d'un repo git
SELECT * FROM howManyMaster;

