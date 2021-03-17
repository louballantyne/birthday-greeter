require 'sinatra'
require 'sinatra/base'

class Greeter < Sinatra::Base

enable :sessions

  get '/' do
    erb :index
  end

  post '/greet' do
    session[:name] = params[:name]
    session[:month] = params[:month]
    session[:day] = params[:day]
    redirect '/birthday'

  end

  get '/birthday' do
    @name = session[:name]
    @month = session[:month]
    @day = session[:day]
    erb :greet
  end
  run! if app_file == $0

end
