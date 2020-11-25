require 'sinatra/base'
require './lib/user'

class Makersbnb < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    session['username'] = params['username']
    User.create(username: params['username'], email: params['email'], password: params['password'])
    redirect :welcome
  end

  get '/welcome' do
    @username = session['username']
    erb :welcome
  end

  get '/homes' do

  end

  post '/homes' do
    
  end
end
