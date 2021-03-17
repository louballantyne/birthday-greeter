require 'sinatra/base'

class Greeter < Sinatra::Base

enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    session[:player2] = params[:player2]
    redirect '/play'
  end

  get '/play' do
    @player2 = session[:player2]
    erb :play
  end
end
