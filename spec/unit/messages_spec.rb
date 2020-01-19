require 'messages'
require 'database_helpers_spec'

describe Messages do

  describe '.all' do
    it 'retrieves all of the messages' do
      connection = PG.connect(dbname: 'chitter_test') 
      message = Messages.create_message(name: 'Emily', message: 'We are learning how to build a full-stack application', peep_handle: 'lajoiedevivre89', time_posted: '08:00')
      Messages.create_message(name: 'Billy', message: 'From Monday we will no longer be the newest cohort', peep_handle: 'housemusic1')
      Messages.create_message(name: 'Jonas', message: 'Tweets sound better than peeps', peep_handle: 'popmusicrocks')
      
      messages = Messages.all 
      expect(messages.length).to eq 3
      expect(message).to be_a Messages
      expect(message.message).to eq 'We are learning how to build a full-stack application'
      expect(message.name).to eq 'Emily'
      expect(message.peep_handle).to eq 'lajoiedevivre89' 
      expect(message.time_posted).to eq '08:00'
     
    end
  end

  describe '.create_message' do
   it 'creates a new message' do
     message = Messages.create_message(name: 'Emily', message: 'Hello', peep_handle: 'lajoiedevivre89', time_posted: '08:00')
     persisted_data = persisted_data(id: message.id) # id() is an attribute reader
     expect(message).to be_a Messages # expect it to be an instance of the Messages class
     expect(message.id).to eq persisted_data['id'] # id()  is an attribute reader
     expect(message.message).to eq 'Hello' # message() is an attribute reader
   end
  end
end