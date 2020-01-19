require 'pg'

 def persisted_data(id:)
   connection = PG.connect(dbname: 'chitter_test') # connect to the test database
   result = connection.query("SELECT * FROM messages WHERE id = #{id};") # query the test database returning the message the whole row with that specific id
   result.first 
 end