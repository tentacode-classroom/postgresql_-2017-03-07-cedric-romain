--Se connecte à la bdd 'gitevents'
\connect gitevents

--Supprime les tables 'actor', 'repository', 'event, 'push_event' et 'issue_event' si elles existent
DROP TABLE IF EXISTS actor CASCADE;
DROP TABLE IF EXISTS repository CASCADE;
DROP TABLE IF EXISTS event CASCADE;

--Supprime le type 'EVENTTYPE' si il existe
DROP TYPE IF EXISTS EVENTTYPE CASCADE;

--Création du type 'EVENTTYPE' du type ENUM. Utiliser dans la table event
CREATE TYPE EVENTTYPE AS ENUM ('PushEvent', 'CreateEvent', 'IssueCommentEvent', 'DeleteEvent', 'WatchEvent', 'ForkEvent', 'PullRequestEvent', 'GollumEvent', 'IssuesEvent', 'PullRequestReviewCommentEvent');

--Création de la table 'actor'
CREATE TABLE actor (
	id serial PRIMARY KEY,
	id_actor int NOT NULL UNIQUE,
	login varchar(45) NOT NULL,
	display_login varchar(45) NOT NULL,
	url varchar(255) NOT NULL,
	avatar_url varchar(255) NOT NULL
);

--Création de la table 'repository'
CREATE TABLE repository (
	id serial PRIMARY KEY,
	id_repo int NOT NULL UNIQUE,
	name varchar(100) NOT NULL,
	url varchar(255) NOT NULL
);

--Création de la table 'event'
CREATE TABLE event(
   id serial PRIMARY KEY,
   eventtype EVENTTYPE NOT NULL,
   created_at TIMESTAMP NOT NULL,
   actor_id INTEGER REFERENCES actor(id),
   repo_id INTEGER REFERENCES repository(id)
);

--Création de la table 'push_event', hérite de la table 'event'
CREATE TABLE push_event (
	commit_count varchar(255) NOT NULL,
	branch_name varchar(255) NOT NULL
) INHERITS (event);

--Création de la table 'issue_event', hérite de la table 'event'
CREATE TABLE issue_event (
	issue_title varchar NOT NULL,
	action varchar(255) NOT NULL
) INHERITS (event);
