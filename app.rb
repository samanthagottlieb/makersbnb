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

  end

  get '/homes/new' do
    erb :"homes/new"
  end

  get '/homes' do
    erb :"homes/index"
  end

  post '/homes' do
    Home.create(name: params[:name], description: params[:description], price: params[:price])
    redirect '/homes'
  end

  run! if app_file == $0
end
