require 'bcrypt'
require_relative './database_connection'

class Users
   attr_reader  :id, :peep_handle, :email

   def initialize(id:, peep_handle:, email: ) # id matches with id messages table  1 to many relationship for users  1 user  many messages
     @id = id
     @peep_handle = peep_handle
     @email = email
   end

  
   def self.create(email:, password:, peep_handle:)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (email, password, peep_handle) VALUES('#{email}', '#{encrypted_password}', '#{peep_handle}') RETURNING id, email, peep_handle;")
    Users.new(
      id: result[0]['id'],
      email: result[0]['email'],
      peep_handle: result[0]['peep_handle']
    )
  end

  def self.find_details(id:)
    return nil unless id 
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id};")
    Users.new(
      id: result[0]['id'],
      email: result[0]['email'],
      peep_handle: result[0]['peep_handle']
    )
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}';")
    return unless result.any? 
    return unless BCrypt::Password.new(result[0]['password']) == password 
    Users.new(
      id: result[0]['id'],
      email: result[0]['email'],
      peep_handle: result[0]['peep_handle']
    )
  end
 end