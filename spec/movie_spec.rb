require 'movie'

describe Movie do

  describe '.all' do
    it 'returns movie list' do
    movies = Movie.all
    expect(movies[0]['title']).to include('The Godfather')
    expect(movies[1]['title']).to include('Scarface')
    expect(movies[2]['title']).to include('Goodfellas')
    end
  end

end
