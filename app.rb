require 'sinatra/base'

class Makersbnb < Sinatra::Base
  enable :sessions
  
  get '/' do
    erb :index
  end

end