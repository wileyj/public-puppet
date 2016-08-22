
/* psql93 -d template1 -U postgres -f postgres.sql -W */
create role admin with Superuser CreateRole CreateDB Replication LOGIN ENCRYPTED PASSWORD 'password';
create role local_ro with LOGIN ENCRYPTED PASSWORD 'password1';
create role local_rw with LOGIN ENCRYPTED PASSWORD 'password2';
create role app_ro with LOGIN ENCRYPTED PASSWORD 'password3';
create role app_rw with LOGIN ENCRYPTED PASSWORD 'password4';

ALTER ROLE app_ro SET search_path TO app_prod, app_qa, app_dev;
ALTER ROLE app_rw SET search_path TO app_prod, app_qa, app_dev;

CREATE DATABASE local OWNER local_rw;
grant all on database local to admin;
grant CONNECT, TEMP on database local to app_rw;
grant CONNECT, TEMP on database local to app_ro;

\connect local

create schema app_dev authorization app_rw;
create schema app_qa authorization app_rw;
create schema app_prod authorization app_rw;

CREATE TYPE app_dev.type AS ENUM ('val1', 'val2', 'val3');
create table app_dev.names(
uid uuid NOT NULL PRIMARY KEY,
email text,
name text,
comment text
);

select name from app_dev.users where app_qa.names is like x;

CREATE TYPE app_qa.type AS ENUM ('val1', 'val2', 'val3');
create table app_qa.names (
uid uuid NOT NULL PRIMARY KEY,
email text,
name text,
comment text
);

CREATE TYPE app_prod.vip AS ENUM ('val1', 'val2', 'val3');
create table app_prod.names (
uid uuid NOT NULL PRIMARY KEY,
email text,
name text,
comment text
);

ALTER TABLE app_dev.users OWNER To app_rw;
ALTER TABLE app_qa.users OWNER To app_rw;
ALTER TABLE app_prod.users OWNER To app_rw;

grant ALL PRIVILEGES on all tables in schema app_dev to admin;
grant ALL PRIVILEGES on all tables in schema app_qa to admin;
grant ALL PRIVILEGES on all tables in schema app_prod to admin;
grant EXECUTE ON ALL FUNCTIONS IN SCHEMA app_dev to admin;
grant EXECUTE ON ALL FUNCTIONS IN SCHEMA app_qa to admin;
grant EXECUTE ON ALL FUNCTIONS IN SCHEMA app_prod to admin;

grant ALL PRIVILEGES on all tables in schema app_dev to app_rw;
grant ALL PRIVILEGES on all tables in schema app_qa to app_rw;
grant ALL PRIVILEGES on all tables in schema app_prod to app_rw;
grant EXECUTE ON ALL FUNCTIONS IN SCHEMA app_dev to app_rw;
grant EXECUTE ON ALL FUNCTIONS IN SCHEMA app_qa to app_rw;
grant EXECUTE ON ALL FUNCTIONS IN SCHEMA app_prod to app_rw;

grant ALL PRIVILEGES on all tables in schema app_dev to local_rw;
grant ALL PRIVILEGES on all tables in schema app_qa to local_rw;
grant ALL PRIVILEGES on all tables in schema app_prod to local_rw;
grant EXECUTE ON ALL FUNCTIONS IN SCHEMA app_dev to local_rw;
grant EXECUTE ON ALL FUNCTIONS IN SCHEMA app_qa to local_rw;
grant EXECUTE ON ALL FUNCTIONS IN SCHEMA app_prod to local_rw;

grant select, TRIGGER on all tables in schema app_dev to app_ro;
grant select, TRIGGER on all tables in schema app_qa to app_ro;
grant select, TRIGGER on all tables in schema app_prod to app_ro;
grant EXECUTE ON ALL FUNCTIONS IN SCHEMA app_dev to app_ro;
grant EXECUTE ON ALL FUNCTIONS IN SCHEMA app_qa to app_ro;
grant EXECUTE ON ALL FUNCTIONS IN SCHEMA app_prod to app_ro;

grant select, TRIGGER on all tables in schema app_dev to local_ro;
grant select, TRIGGER on all tables in schema app_qa to local_ro;
grant select, TRIGGER on all tables in schema app_prod to local_ro;
grant EXECUTE ON ALL FUNCTIONS IN SCHEMA app_dev to local_ro;
grant EXECUTE ON ALL FUNCTIONS IN SCHEMA app_qa to local_ro;
grant EXECUTE ON ALL FUNCTIONS IN SCHEMA app_prod to local_ro;
