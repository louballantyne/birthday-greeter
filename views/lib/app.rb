require 'sinatra'
require 'sinatra/base'

#class Greeter < Sinatra::Base

enable :sessions

  get '/' do
    erb :index
    "Hello World"
  end

  post '/greet' do
    session[:name] = params[:name]
    session[:birthday] = params[:birthday]
    redirect '/birthday'
  end

  get '/birthday' do
    @name = session[:name]
    @birthday = session[:birthday]
    erb :greet
  end
#end
