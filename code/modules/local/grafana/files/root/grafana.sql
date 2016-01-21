
/* /usr/pgsql-9.4/bin/psql -d template1 -U postgres -f grafana.sql -w */
create role grafana with LOGIN ENCRYPTED PASSWORD 'password';
CREATE DATABASE grafana OWNER grafana;
grant all on database graphite to admin;
grant all on database graphite to grafana;