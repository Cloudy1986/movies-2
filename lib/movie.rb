require 'pg'

class Movie

  def self.all
    connection = PG.connect(dbname: 'movie_database')
    result = connection.exec("SELECT * FROM movies;")
    result.map { |movie| movie }
  end

end
