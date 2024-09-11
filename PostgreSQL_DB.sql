psql -U postgres

create database AccountingDB;
create user Account_web;
create user Account_owner;

ALTER USER Account_web WITH PASSWORD 'pwd';
ALTER USER Account_owner WITH PASSWORD 'pwd';

psql -U postgres -d AccountingDB

REVOKE CREATE ON SCHEMA public FROM PUBLIC;

grant usage on schema public to Account_owner;

GRANT ALL PRIVILEGES ON SCHEMA public to Account_owner;
GRANT all privileges on all tables IN SCHEMA public TO Account_owner.

# if you want to enable the owner to create new schema within the database
grant create on database AccountingDB to Account_owner;

grant usage on schema public to Account_web;

GRANT SELECT, update, delete, insert ON ALL TABLES IN SCHEMA public TO Account_web;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public to Account_web;

psql -U Account_owner -d AccountingDB

ALTER DEFAULT PRIVILEGES in schema public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO Account_web;
ALTER DEFAULT PRIVILEGES in schema public GRANT USAGE, SELECT ON SEQUENCES to Account_web;

