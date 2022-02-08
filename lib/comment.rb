class Comment

  def self.create(text:, movie_id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'movie_database_test')
    else
      connection = PG.connect(dbname: 'movie_database')
    end
    result = connection.exec_params("INSERT INTO comments (text, movie_id) VALUES ($1, $2) RETURNING id, text, movie_id;", [text, movie_id])
    # Will need to create a new comment here e.g Comment.new(id: title: movie:)
  end

end
