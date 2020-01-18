require 'sinatra/base'
require './lib/messages'
require 'pg'
require  './setup_database_environment_dependent'

class Chitter < Sinatra::Base 
  

  get '/' do
    "Chitter - for all your Chatter"
  end

  get '/index' do
    @messages = Messages.all
    erb(:index)
   end

  post '/messages' do
     p params
     message = params['message'] # message is what we type in the form - we get back
     DatabaseConnection.query("INSERT INTO messages (message) VALUES('#{message}');") #we put what was entered in form into the database
     redirect '/messages'
  end

  get '/messages/new' do 
    erb(:'messages/new')
  end

  get '/messages' do
    #message = params['message']
    @messages = Messages.all
  end



 
     




  run if app_file == $0

end 