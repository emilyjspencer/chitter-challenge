require_relative 'database_connection' 

class Messages# updates messages - we need to deal with specific instances - i.e. a single message(peep)

  attr_reader :id, :name, :message, :peep_handle, :timestamp # an instance of a message has an id and a message

  def initialize(id:, name:, message:, peep_handle:, timestamp:) 
    @id = id
    @name = name
    @message = message
    @peep_handle = peep_handle
    @timestamp = Time.parse(timestamp).strftime("%I:%M %p") 
  end

  def self.all 
    result = DatabaseConnection.query("SELECT * FROM messages;") 
    result.map do |message|
      Messages.new(id: message['id'], name: message['name'], message: message['message'], peep_handle: message['peep_handle'], timestamp: message['posted_at'])
    end.reverse
  end 

  def self.create_message(name:, message:, peep_handle:, timestamp:) 
    result = DatabaseConnection.query("INSERT INTO messages (name, message, peep_handle) VALUES(' #{name}', '#{message}', '#{peep_handle}') RETURNING id, name, message, peep_handle, posted_at;")
    Messages.new(id: result[0]['id'], name: result[0]['name'], message: result[0]['message'], peep_handle: result[0]['peep_handle'], timestamp: result[0]['posted_at'])
  end 

end 