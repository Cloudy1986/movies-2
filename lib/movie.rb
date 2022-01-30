require 'pg'

class Movie

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'movie_database_test')
    else
      connection = PG.connect(dbname: 'movie_database')
    end
    result = connection.exec("SELECT * FROM movies;")
    result.map { |movie| movie }
  end

end
