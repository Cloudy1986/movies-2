require 'movie'

describe Movie do

  describe '.all' do
    it 'returns movie list' do
    movies = Movie.all
    expect(movies).to include('The Godfather')
    expect(movies).to include('Scarface')
    expect(movies).to include('Goodfellas')
    end
  end

end
