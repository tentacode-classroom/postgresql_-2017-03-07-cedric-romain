--Supprime la bdd 'gitevents' si elle existe et la recréer
DROP DATABASE IF EXISTS gitevents;
CREATE DATABASE gitevents;

--Se connecte à la bdd 'gitevents'
\connect gitevents

--Création du type 'EVENTTYPE' du type ENUM. Utiliser dans la table event
CREATE TYPE EVENTTYPE AS ENUM ('PushEvent', 'CreateEvent', 'IssueCommentEvent', 'DeleteEvent', 'WatchEvent', 'ForkEvent', 'PullRequestEvent', 'GollumEvent', 'IssuesEvent', 'PullRequestReviewCommentEvent');

--Création de la table 'actor'
CREATE TABLE actor (
	id serial PRIMARY KEY,
	login varchar(45) NOT NULL,
	display_login varchar(45) NOT NULL,
	url varchar(255) NOT NULL,
	avatar_url varchar(255) NOT NULL
);

--Création de la table 'repository'
CREATE TABLE repository (
	id serial PRIMARY KEY,
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
	issue_title varchar(255) NOT NULL,
	action varchar(255) NOT NULL
) INHERITS (event);

--Insert de test
INSERT INTO actor(login, display_login, url, avatar_url) VALUES ('jeanmichelaulas', 'jeanmi', 'http://url', '/avatar/url');
INSERT INTO repository(name,url) VALUES ('projet_yolo','http://url');
INSERT INTO event(eventtype, created_at, actor_id, repo_id) VALUES ('PushEvent', '2017-03-07T01:00:00Z','1','1');
