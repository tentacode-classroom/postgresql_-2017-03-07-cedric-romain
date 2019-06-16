--Se connect à la bdd gitevents
\connect gitevents

--Insertion dans la table repository
INSERT INTO repository (id_repo, name, url)
SELECT DISTINCT ON(data_json->'repo'->>'id') (data_json->'repo'->>'id')::integer, (data_json->'repo'->>'name'), (data_json->'repo'->'url') from events_raw;

--Insertion dans la table actor
INSERT INTO actor (id_actor, login, display_login, url, avatar_url)
SELECT DISTINCT ON(data_json->'actor'->>'id') (data_json->'actor'->>'id')::integer, (data_json->'actor'->>'login'), (data_json->'actor'->>'display_login'), (data_json->'actor'->'url'), (data_json->'actor'->>'avatar_url') from events_raw;

--Insertion dans la table push_event
INSERT INTO push_event (eventtype, created_at, actor_id, repo_id, commit_count, branch_name)
SELECT CAST (events_raw.data_json->>'type' as EVENTTYPE), CAST (events_raw.data_json->>'created_at' as TIMESTAMP), actor.id, repository.id, CAST (data_json->'payload'->'size' as INTEGER), (data_json->'payload'->>'ref') FROM events_raw, actor, repository WHERE events_raw.data_json->>'type' = 'PushEvent' AND (data_json->'actor'->'id')::integer = actor.id_actor AND (data_json->'repo'->'id')::integer=repository.id_repo;

--Insertion dans la table issue_event
INSERT INTO issue_event (eventtype, created_at, actor_id, repo_id, issue_title, action)
SELECT CAST (events_raw.data_json->>'type' as EVENTTYPE), CAST (events_raw.data_json->>'created_at' as TIMESTAMP), actor.id, repository.id, (data_json->'payload'->'issue'->>'title'), (data_json->'payload'->>'action') FROM events_raw, actor, repository WHERE data_json->>'type' = 'IssuesEvent' AND (data_json->'actor'->'id')::integer = actor.id_actor AND (data_json->'repo'->'id')::integer=repository.id_repo;

