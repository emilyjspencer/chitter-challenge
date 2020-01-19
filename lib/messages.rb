require_relative 'database_connection' 

class Messages# updates messages - we need to deal with specific instances - i.e. a single message(peep)

  attr_reader :id, :name, :message, :peep_handle # an instance of a message has an id and a message

  def initialize(id:, name:, message:, peep_handle: ) 
    @id = id
    @name = name
    @message = message
    @peep_handle = peep_handle
  end

  def self.all # result is the object that comes out of the database when we query it
    result = DatabaseConnection.query("SELECT * FROM messages;") # production database
    
    result.map do |message|
      Messages.new(id: message['id'], name: message['name'], message: message['message'], peep_handle: message['peep_handle'])
    end.reverse
  end 

  def self.create_message(name:, message:, peep_handle:) 
    result = DatabaseConnection.query("INSERT INTO messages (name, message, peep_handle) VALUES(' #{name}', '#{message}', '#{peep_handle}') RETURNING id, name, message, peep_handle;")
    Messages.new(id: result[0]['id'], name: result[0]['name'], message: result[0]['message'], peep_handle: result[0]['peep_handle'])
    # create a new instance of the Messages class  - where the id is the first item in the array of hashes
  end # wrap the message in a Messages object 

end 