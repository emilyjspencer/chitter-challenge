
require 'pg'

def wipe_test_database
  p "Setting up test database......"

  connection = PG.connect(dbname: 'chitter_test') # connect to the test database 


  connection.exec("TRUNCATE messages_test;") # Clear the messages table

end 