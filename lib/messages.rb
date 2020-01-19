require_relative 'database_connection' 

class Messages# updates messages - we need to deal with specific instances - i.e. a single message(peep)

  attr_reader :id, :name, :message, :peep_handle, :time_posted # an instance of a message has an id and a message

  def initialize(id:, name:, message:, peep_handle:, time_posted:) 
    @id = id
    @name = name
    @message = message
    @peep_handle = peep_handle
    @time_posted = Time.parse(time_posted).strftime("%I:%M %p") 
  end

  def self.all 
    result = DatabaseConnection.query("SELECT * FROM messages;") 
    result.map do |message|
      Messages.new(id: message['id'], name: message['name'], message: message['message'], peep_handle: message['peep_handle'], time_posted: message['time_posted'])
    end.reverse
  end 

  def self.create_message(name:, message:, peep_handle:, time_posted:) 
    result = DatabaseConnection.query("INSERT INTO messages (name, message, peep_handle, time_posted) VALUES(' #{name}', '#{message}', '#{peep_handle}, '#{time_posted}') RETURNING id, name, message, peep_handle, time_posted;")
    Messages.new(id: result[0]['id'], name: result[0]['name'], message: result[0]['message'], peep_handle: result[0]['peep_handle'], time_posted: result[0]['time_posted'])
  end 

end 