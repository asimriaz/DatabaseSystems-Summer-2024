1. https://github.com/drminnaar/guides/blob/master/postgresql-guide/1-getting-started.md#next-steps
1. https://github.com/Apress/beg-dbs-w-postgresql/tree/master
1. https://github.com/dhamaniasad/awesome-postgres


## Create User
CREATE USER teamname WITH ENCRYPTED PASSWORD 'password';
CREATE DATABASE yourdb OWNER teamname;

ALTER USER teamname WITH PASSWORD 'hello.123';
