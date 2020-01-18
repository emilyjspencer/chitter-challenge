require 'sinatra/base'

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