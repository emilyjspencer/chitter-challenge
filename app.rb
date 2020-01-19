require 'sinatra/base'
require './lib/messages'
require './lib/users'
require 'pg'
require './setup_database_environment_dependent'
require 'sinatra/flash'

class Chitter < Sinatra::Base 

  enable :sessions # to store user input in the session(remember it)
  register Sinatra::Flash # will enable pop up messages

  post '/sessions' do
    user = Users.authenticate(email: params[:email], password: params[:password]) # what the user input as email and password is stored in the session
    if user
      session[:user_id] = user.id
      redirect '/messages'
    else
      flash[:notice] = 'Email or password incorrect. Unable to sign in'
      redirect '/sessions/new'
    end 
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end


  get '/' do
    @messages = Messages.all 
    erb(:index)
  end

  post '/messages' do
     Messages.create_message(name: params[:name], message: params[:message], peep_handle: params[:peep_handle])
     redirect '/'
  end

  get '/messages' do
    p "---------------------------" 
    p session[:user_id]
    @user = Users.find_details(id: session[:user_id])
    message = params['message']
    @messages = Messages.all
    erb(:messages)
  end

  post '/users/new' do 
    redirect '/users/new'
  end

  get '/users/new' do
    erb(:'users/new') 
  end

  post '/users' do
   "You have successfuly registered for a Chitter account!"
  end

  get '/users' do
    user = Users.create(email: params[:email], password: params[:password], peep_handle: params[:peep_handle])
    session[:user_id] = user.id
    "You have successfuly registered for a Chitter account!"
    erb(:users)
    redirect '/users'
  end

  run if app_file == $0

end 