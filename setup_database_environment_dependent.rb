
require './lib/database_connection'

 if ENV['ENVIRONMENT'] == 'test'
   DatabaseConnection.establish_connection('chitter_test') # set up connection to the test database if we're in the test environment
 else
   DatabaseConnection.establish_connection('chitter') # otherwise set up connection to the production database
 end 
