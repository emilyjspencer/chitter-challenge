require 'sinatra/base'
require './lib/messages'
require './lib/users'
require 'pg'
require  './setup_database_environment_dependent'
require 'sinatra/flash'

class Chitter < Sinatra::Base 
  
  get '/' do
    @messages = Messages.all 
    erb(:index)
  end

  post '/messages' do
     Messages.create_message(name: params[:name], message: params[:message], peep_handle: params[:peep_handle])
     redirect '/'
  end

  get '/messages' do
    p "*******************" 
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