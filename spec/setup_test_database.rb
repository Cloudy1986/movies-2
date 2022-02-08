require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'movie_database_test')
  p "Setting up test database"
  connection.exec("TRUNCATE movies, comments;")
end
