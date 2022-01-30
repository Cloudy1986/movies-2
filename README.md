# Movie Manager

## Database set up

Set up development database:
1. `psql`
2. `CREATE DATABASE movie_database;`
3. `CREATE TABLE movies (id SERIAL PRIMARY KEY, title VARCHAR(100));`

Set up test database:
1. `psql`
2. `CREATE DATABASE movie_database_test;`
3. `CREATE TABLE movies (id SERIAL PRIMARY KEY, title VARCHAR(100));`
