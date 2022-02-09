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

  describe '.where' do
    it 'returns the comments based on their movie_id' do
      movie = Movie.create(title: 'Antman')
      Comment.create(text: 'This is a comment on Antman' , movie_id: movie.id)
      Comment.create(text: 'This is another comment on Antman' , movie_id: movie.id)

      comments = Comment.where(movie_id: movie.id)

      expect(comments.length).to eq 2
      expect(comments.first).to be_a Comment
      expect(comments.first.text).to eq 'This is a comment on Antman'
      expect(comments.first.movie_id).to eq movie.id
      expect(comments.last.text).to eq 'This is another comment on Antman'
      expect(comments.last.movie_id).to eq movie.id
    end
  end

end