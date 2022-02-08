# Movie Manager

## Database set up

Set up development database:
1. `psql`
2. `CREATE DATABASE movie_database;`
3. `\c movie_database;`
4. `CREATE TABLE movies (id SERIAL PRIMARY KEY, title VARCHAR(100));`
5. `CREATE TABLE comments (id SERIAL PRIMARY KEY, text VARCHAR(200), movie_id INTEGER REFERENCES movies (id));`

Set up test database:
1. `psql`
2. `CREATE DATABASE movie_database_test;`
3. `\c movie_database_test;`
4. `CREATE TABLE movies (id SERIAL PRIMARY KEY, title VARCHAR(100));`
5. `CREATE TABLE comments (id SERIAL PRIMARY KEY, text VARCHAR(200), movie_id INTEGER REFERENCES movies (id));`
