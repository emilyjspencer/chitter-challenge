require 'sinatra/base'
require './lib/messages'
require './lib/users'
require 'pg'
require './setup_database_environment_dependent'
require 'sinatra/flash'

class Chitter < Sinatra::Base 

  enable :sessions 
  register Sinatra::Flash 

  post '/sessions' do
    user = Users.authenticate(email: params[:email], password: params[:password]) 
    if user
      session[:user_id] = user.id
      redirect '/messages'
    else
      flash[:notice] = 'Email or password incorrect. Unable to sign in'
      redirect '/sessions/new'
    end 
  end

  get '/sessions/new' do
    erb(:"sessions/new")
  end


  get '/' do
    erb(:"home/index")
  end

  post '/messages' do
     Messages.create_message(message: params[:message], user_id: session[:user_id])
     redirect '/messages'
  end

  get '/messages' do
    @user = Users.find_details(id: session[:user_id])
    redirect '/' if @user.nil?
    @messages = Messages.all
    erb(:"messages/index")
  end

  post '/users' do 
    user = Users.create(email: params[:email], password: params[:password], peep_handle: params[:peep_handle])
    session[:user_id] = user.id
    redirect '/messages'
  end

  post '/users/new' do
    "Hello World"
  end

  get '/users/new' do
    erb(:"users/new") 
  end


  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have been signed out of Chitter'
    redirect '/'
  end 

  run if app_file == $0

end 