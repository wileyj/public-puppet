
/* /usr/pgsql-9.4/bin/psql -d template1 -U postgres -f graphite.sql -w */
create role admin with Superuser CreateRole CreateDB Replication LOGIN ENCRYPTED PASSWORD 'password'; 
create role graphite with LOGIN ENCRYPTED PASSWORD 'password';
CREATE DATABASE graphite OWNER graphite;
grant all on database graphite to admin;
grant all on database graphite to graphite;