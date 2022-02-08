require 'sinatra/base'
require 'sinatra/reloader'
require './lib/movie'

class MovieManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions, :method_override

  get '/' do
    erb :homepage
  end

  get '/movies' do
    @movies = Movie.all
    erb :'movies/index'
  end

  get '/movies/new' do
    erb :'movies/new'
  end

  post '/movies' do
    Movie.create(title: params['title'])
    redirect '/movies'
  end

  delete '/movies/:id' do
    Movie.delete(id: params['id'])
    redirect '/movies'
  end

  get '/movies/:id/edit' do
    @movie = Movie.find(id: params['id'])
    erb :'movies/edit'
  end

  patch '/movies/:id' do
    Movie.update(id: params['id'], title: params['title'])
    redirect '/movies'
  end

  get '/movies/:id/comment/new' do
    @movie = Movie.find(id: params['id'])
    erb :'comments/new'
  end

  post '/movies/:id/comment' do
    # p params['comment_text']
    # p params['id'] #id for movie
    # Add the comment to the database
    # Comment.create(text: params['comment_text'] movie_id: params['id'])
    redirect '/movies'
  end

  run! if app_file == $0
end
