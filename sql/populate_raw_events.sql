\connect gitevents

CREATE TABLE events_raw (
       id serial PRIMARY KEY,
       data_json jsonb NOT NULL
);

