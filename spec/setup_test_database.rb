
require 'pg'

p "Setting up test database......"

connection = PG.connect(dbname: 'messages_test')

# Clear the messages table
connection.exec("TRUNCATE message;")