require 'movie'

describe Movie do

  describe '.all' do
    it 'returns movie list' do
    connection = PG.connect(dbname: 'movie_database_test')
    connection.exec("INSERT INTO movies (title) VALUES ('The Godfather');")
    connection.exec("INSERT INTO movies (title) VALUES ('Scarface');")
    connection.exec("INSERT INTO movies (title) VALUES ('Goodfellas');")

    movies = Movie.all
    
    expect(movies[0]).to be_a Movie
    expect(movies.length).to eq 3
    expect(movies[0].title).to eq 'The Godfather'
    expect(movies[1].title).to eq 'Scarface'
    expect(movies[2].title).to eq 'Goodfellas'
    end
  end

  describe '.create' do
    it 'adds a movie to the database' do
      movie = Movie.create(title: 'Platoon')
      
      connection = PG.connect(dbname: 'movie_database_test')
      result = connection.query("SELECT * FROM movies WHERE id = #{movie.id};")
      
      expect(movie).to be_a Movie
      expect(movie.id).to eq result[0]['id']
      expect(movie.title).to eq result[0]['title']
    end
  end

  describe '.delete' do
    it 'deletes a movie from the database' do
      movie = Movie.create(title: 'The Dark Knight')
      Movie.delete(id: movie.id)
      movies = Movie.all

      expect(movies.length).to eq 0
    end
  end

  describe '.find' do
    it 'returns the movie with the correct id' do
      movie = Movie.create(title: 'Spiderman')
      returned_movie = Movie.find(id: movie.id)

      expect(returned_movie).to be_a Movie
      expect(returned_movie.id).to eq movie.id
      expect(returned_movie.title).to eq movie.title
    end
  end

end
