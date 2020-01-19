require 'messages'
require 'database_helpers'

describe Messages do

  describe '.all' do
    it 'retrieves all of the messages' do
      connection = PG.connect(dbname: 'chitter_test') 
      message = Messages.create_message(name: 'Emily', message: 'We are learning how to build a full-stack application', peep_handle: 'lajoiedevivre89', timestamp: '05:30:07')
      Messages.create_message(name: 'Billy', message: 'From Monday we will no longer be the newest cohort', peep_handle: 'housemusic1', timestamp: '05:30:07')
      Messages.create_message(name: 'Jonas', message: 'Tweets sound better than peeps', peep_handle: 'popmusicrocks', timestamp: '05:30:07')
      messages = Messages.all 
      expect(messages.length).to eq 3
      expect(message).to be_a Messages
      expect(message.message).to eq 'We are learning how to build a full-stack application'
      expect(message.name).to eq 'Emily'
      expect(message.peep_handle).to eq 'lajoiedevivre89' 
      expect(message.timestamp).to eq '05:30:07'
    end
  end

  describe '.create_message' do
   it 'creates a new message' do
     message = Messages.create_message(name: 'Emily', message: 'Hello', peep_handle: 'lajoiedevivre89', timestamp: '05:30:07')
     persisted_data = persisted_data(table: 'messages', id: message.id)
     expect(message).to be_a Messages # expect it to be an instance of the Messages class
     expect(message.id).to eq persisted_data.first['id'] # id()  is an attribute reader
     expect(message.message).to eq 'Hello' # message() is an attribute reader
   end
  end       
end