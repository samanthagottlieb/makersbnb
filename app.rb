require './database_connection_setup'
require './lib/home'
require './lib/user'
require 'sinatra/base'

class Makersbnb < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/signup' do

  end

  post '/signup' do
    session[:username] = 'Guest' # should become user.username

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
