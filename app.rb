require './database_connection_setup'
require './lib/home'
require './lib/user'
require 'sinatra/base'
require 'sinatra/flash'

class Makersbnb < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :"users/signup"
  end

  post '/signup' do
    session[:username] = params[:username]
    User.create(username: params[:username], email: params[:email], password: params[:password])
    redirect :homes
  end

  get '/welcome' do
    @username = session[:username]
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
    username = session[:username]
    Home.create(name: params[:name], description: params[:description], price: params[:price], username: username)

    redirect :homes
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(username: params[:username], password: params[:password])

    if user
      session[:user_id] = user.id
      redirect('/homes')
    else
      flash[:notice] = 'Incorrect username or password'
      redirect('/sessions/new')
    end
  end

  run! if app_file == $0
end
