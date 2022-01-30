require 'sinatra/base'
require 'sinatra/reloader'

class MovieManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :homepage
  end

  get '/movies' do
    erb :index
  end

  run! if app_file == $0
end
