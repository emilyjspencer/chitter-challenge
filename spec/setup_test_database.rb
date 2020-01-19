
require 'pg'

def
  p "Setting up test database......"

  connection = PG.connect(dbname: 'chitter_test') # connect to the test database 


  connection.exec("TRUNCATE messages, users;") # Clear the messages table

end 