require './database_connection_setup'
require './lib/availability'
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
    start_date = params[:start_date]
    end_date = params[:end_date]
    home = Home.create(name: params[:name], description: params[:description], price: params[:price], username: username)
    Availability.create(home_id: home.id, start_date: start_date, end_date: end_date)
    redirect :homes
  end  
  
  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    session[:username] = params[:username]
    user = User.authenticate(username: params[:username], password: params[:password])

    if user
      session[:user_id] = user.id
      redirect('/homes')
    else
      flash[:notice1] = 'Incorrect username or password'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/homes')   

  get '/homes/availability' do
    session[:name] = params.flatten[0]
    home_id = session[:name]
    @availability = Availability.view(home_id: home_id)
    erb :"homes/availability"
  end

  run! if app_file == $0
end
