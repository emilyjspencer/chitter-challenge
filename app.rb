require 'sinatra/base'
require './lib/messages'
require 'pg'
#require './database_connection_setup' 
require  './setup_database_environment_dependent'

class Chitter < Sinatra::Base 

  get '/' do
    "Chitter - for all your Chatter"
  end

  get '/index' do
    @messages = Messages.all
    erb (:index)
   end


  run if app_file == $0

end 