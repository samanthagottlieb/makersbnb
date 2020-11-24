require 'sinatra/base'

class Makersbnb < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    sessions['username'] = params['username']
    redirect :welcome
  end

  get '/welcome' do
    @username = sessions['username']
    erb :welcome
  end

  get '/homes' do

  end

  post '/homes' do
    
  end
end
