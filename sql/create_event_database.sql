DROP DATABASE IF EXISTS gitevents;
CREATE DATABASE gitevents;

\connect gitevents

CREATE TYPE EVENTYPE AS ENUM ('PushEvent', 'CreateEvent', 'IssueCommentEvent', 'DeleteEvent', 'WatchEvent', 'ForkEvent', 'PullRequestEvent', 'GollumEvent', 'IssuesEvent', 'PullRequestReviewCommentEvent');

CREATE TABLE actor (
	id serial PRIMARY KEY,
	login varchar(45) NOT NULL,
	display_login varchar(45) NOT NULL,
	url varchar(255) NOT NULL,
	avatar_url varchar(255) NOT NULL
);

CREATE TABLE repository (
	id serial PRIMARY KEY,
	name varchar(100) NOT NULL,
	url varchar(255) NOT NULL
);


CREATE TABLE event(
   id serial PRIMARY KEY,
   eventtype EVENTYPE NOT NULL,
   created_at TIMESTAMP NOT NULL,
   actor_id INTEGER REFERENCES actor(id),
   repo_id INTEGER REFERENCES repository(id)
);

CREATE TABLE push_event (
	commit_count varchar(255) NOT NULL,
	branch_name varchar(255) NOT NULL
) INHERITS (event);

CREATE TABLE issue_event (
	issue_title varchar(255) NOT NULL,
	action varchar(255) NOT NULL
) INHERITS (event);

INSERT INTO actor(login, display_login, url, avatar_url) VALUES ('jeanmichelaulas', 'jeanmi', 'http://url', '/avatar/url');
INSERT INTO repository(name,url) VALUES ('projet_yolo','http://url');
INSERT INTO event(eventtype, created_at, actor_id, repo_id) VALUES ('PushEvent', '2017-03-07T01:00:00Z','1','1');
