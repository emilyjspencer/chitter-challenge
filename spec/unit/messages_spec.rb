require 'messages'
require 'database_helpers'

describe Messages do

  describe '.all' do
    it 'retrieves all of the messages' do
      connection = PG.connect(dbname: 'chitter_test') 
      user = Users.create(email: 'emily@gmail.com', password: '12345', peep_handle: 'lajoiedevivre89')
      message = Messages.create_message(message: 'We are learning how to build a full-stack application', user_id: user.id)
      Messages.create_message( message: 'From Monday we will no longer be the newest cohort', user_id: user.id)
      Messages.create_message( message: 'Tweets sound better than peeps', user_id: user.id)
      messages = Messages.all 
      expect(messages.length).to eq 3
      expect(message).to be_a Messages
      expect(message.message).to eq 'We are learning how to build a full-stack application'
    end
  end

  describe '.create_message' do
   it 'creates a new message' do
     user = Users.create(email: 'emily@gmail.com', password: '12345', peep_handle: 'lajoiedevivre89')
     message = Messages.create_message(message: 'Hello', user_id: user.id)
     persisted_data = persisted_data(table: 'messages', id: message.id)
     expect(message).to be_a Messages 
     expect(message.id).to eq persisted_data.first['id'] 
     expect(message.message).to eq 'Hello' 
   end
  end       
end