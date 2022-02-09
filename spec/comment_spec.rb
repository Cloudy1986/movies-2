require 'comment'

describe Comment do
  
  describe '.create' do
    it 'adds a comment to the database' do
      movie = Movie.create(title: 'This is a test title')

      comment = Comment.create(text: 'This is text for a comment', movie_id: movie.id)

      test_connection = PG.connect(dbname: 'movie_database_test')
      test_result = test_connection.exec_params('SELECT * FROM comments WHERE movie_id = $1;', [movie.id])
      
      expect(comment).to be_a Comment
      expect(comment.text).to eq 'This is text for a comment'
      expect(comment.movie_id).to eq movie.id
      expect(comment.text).to eq test_result[0]['text']
      expect(comment.movie_id).to eq test_result[0]['movie_id']
    end
  end

end