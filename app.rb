require './database_connection_setup'
require './lib/home'
require './lib/user'
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

  get '/homes/new' do
    erb :"homes/new"
  end

  get '/homes' do
    @homes = Home.all
    erb :"homes/index"
  end

  post '/homes' do
    session[:username] !=nil ? username = session[:username] : username = 'Guest'
    Home.create(name: params[:name], description: params[:description], price: params[:price], username: username)

    redirect '/homes'
  end

  run! if app_file == $0
end
