--Se connecte à la bdd gitevents
\connect gitevents

--Supprime la table 'events_raw' si elle existe
DROP TABLE IF EXISTS events_raw;

--Créé une table 'events_raw' avec un champ 'id' et un champ 'data_json' de type jsonb
CREATE TABLE events_raw (
       id serial PRIMARY KEY,
       data_json jsonb NOT NULL
);

