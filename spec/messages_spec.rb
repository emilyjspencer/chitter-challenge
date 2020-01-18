require 'messages'

describe '.all' do
  it 'retrieves all of the messages' do
    connection = PG.connect(dbname: 'chitter_test') # connect to the test database
    connection.exec("INSERT INTO messages_test(message) VALUES ('We are learning how to build a full-stack application');") # add test1
    connection.exec("INSERT INTO messages_test(message) VALUES ('From Monday we will no longer be the newest cohort');") # add test message 2
    connection.exec("INSERT INTO messages_test(message) VALUES ('Tweets sound better than peeps');") # add test message 3
    messages = Messages.all # call all method
    expect(messages).to include('We are learning how to build a full-stack application') # expect tes1 message to be retrieved from db
    expect(messages).to include('From Monday we will no longer be the newest cohort') # expect test2 message to be retrieved from db
    expect(messages).to include('Tweets sound better than peeps') # expect test3 message to be retrieved from db  
  end
end