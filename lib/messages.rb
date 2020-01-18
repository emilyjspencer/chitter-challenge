require_relative 'database_connection'

class Messages
  def self.all
    #[
     #'We are learning how to build a full-stack application',
     #'From Monday we will no longer be the newest cohort',
     #'Tweets sound better than peeps'
    #]
    result = DatabaseConnection.query("SELECT * FROM messages;") # production database
    #result = DatabaseConnection.query("SELECT * FROM messages_test;") # result object returned when we query database - array of hashes
    result.map { |message| message['message'] } # map through it and return each message(peep) written by user 
  end 

end 