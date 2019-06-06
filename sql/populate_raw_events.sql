--Se connecte à la bdd gitevents
\connect gitevents

--Créé une table 'events_raw' avec un champ 'id' et un champ 'data_json' de type jsonb
CREATE TABLE events_raw (
       id serial PRIMARY KEY,
       data_json jsonb NOT NULL
);

