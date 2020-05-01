require_relative 'database_connection' 

class Messages# updates messages - we need to deal with specific instances - i.e. a single message(peep)

  attr_reader :id, :message, :user_id, :timestamp # an instance of a message has an id and a message

  def initialize(id:, message:, user_id: ,timestamp:) 
    @id = id
    @message = message
    @user_id = user_id
    @timestamp = Time.parse(timestamp).strftime("%I:%M %p") 
  end

  def self.all 
    result = DatabaseConnection.query("SELECT * FROM messages;") 
    result.map do |message|
      Messages.new(id: message['id'], message: message['message'], user_id: message['user_id'], timestamp: message['posted_at'])
    end.reverse
  end 

  def self.create_message(message:, user_id: ) 
    result = DatabaseConnection.query("INSERT INTO messages (message, user_id) VALUES('#{message}', '#{user_id}') RETURNING id, message, user_id, posted_at;")
    Messages.new(id: result[0]['id'], message: result[0]['message'], user_id: result[0]['user_id'], timestamp: result[0]['posted_at'])
  end 

end 