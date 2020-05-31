class User
   attr_reader  :id, :peep_handle, :email

   def initialize(id:, peep_handle:, email: ) 
     @id = id
     @peep_handle = peep_handle
     @email = email
   end

   def self.create(email:, password:, peep_handle:)
     encrypted_password = BCrypt::Password.create(password)
     result = DatabaseConnection.query("INSERT INTO users (email, password, peep_handle) VALUES('#{email}', '#{encrypted_password}', '#{peep_handle}') RETURNING id, email, peep_handle;")
     User.new(id: result[0]['id'], email: result[0]['email'], handle: result[0]['peep_handle'])
   end
 end