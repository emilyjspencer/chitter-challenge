require 'sinatra/base'

class Chitter < Sinatra::Base 

  get '/' do
    "Chitter - for all your Chatter"
  end

  get '/index' do
   [
    'We are learning how to build a full-stack application',
    'From Monday we will no longer be the newest cohort', 
    'Tweets sounds better than Peeps'
   ]
  end 


  run if app_file == $0

end 