require 'sinatra/base'

class Makersbnb < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/signup' do

  end

  post '/signup' do

  end

  get '/homes' do

  end

  post '/homes' do
    
  end
end
