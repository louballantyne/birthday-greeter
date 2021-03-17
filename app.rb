require 'sinatra'
require 'sinatra/base'
require 'date'

class Greeter < Sinatra::Base

enable :sessions

  get '/' do
    erb :index
  end

  post '/greet' do
    session[:name] = params[:name]
    @month = Date::MONTHNAMES.index(params[:month])
    @birthday = Date.parse("#{@month}/#{params[:day]}")
    if @birthday > DateTime.now
      session[:days]=(@birthday - DateTime.now).to_i
    else
      session[:days]=(Date.parse("12/31")-DateTime.now).to_i + (@birthday - Date.parse("1/1")).to_i + 1
    end
    redirect '/birthday'
  end

  get '/birthday' do
    @name = session[:name]
    @days = session[:days]
    erb :greet
  end
  run! if app_file == $0

end
