require 'movie'

describe Movie do

  describe '.all' do
    it 'returns movie list' do
    connection = PG.connect(dbname: 'movie_database_test')
    connection.exec("INSERT INTO movies (title) VALUES ('The Godfather');")
    connection.exec("INSERT INTO movies (title) VALUES ('Scarface');")
    connection.exec("INSERT INTO movies (title) VALUES ('Goodfellas');")

    movies = Movie.all

    expect(movies[0]['title']).to include('The Godfather')
    expect(movies[1]['title']).to include('Scarface')
    expect(movies[2]['title']).to include('Goodfellas')
    end
  end

end
