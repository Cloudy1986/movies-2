require 'pg'

class Movie

  attr_reader :id, :title

  def initialize(id:, title:)
    @id = id
    @title = title
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'movie_database_test')
    else
      connection = PG.connect(dbname: 'movie_database')
    end
    result = connection.exec("SELECT * FROM movies;")
    result.map do |movie|
      Movie.new(id: movie['id'], title: movie['title'])
    end
  end

end
