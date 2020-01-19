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
     Messages.create_message(name: params[:name], message: params[:message], peep_handle: params[:peep_handle])
     redirect '/messages'
  end

  get '/messages/new' do 
    erb(:'messages/new')
  end

  get '/messages' do
    message = params['message']
    @messages = Messages.all
    erb(:messages)
  end




 
     




  run if app_file == $0

end 