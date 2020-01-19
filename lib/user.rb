class User
   attr_reader  :id, :peep_handle, :email

   def initialize(id:, peep_handle:, email: ) # id matches with id messages table  1 to many relationship for users  1 user  many messages
     @id = id
     @peep_handle = peep_handle
     @email = email
   end

   def self.create(email:, password:, peep_handle:)
     result = DatabaseConnection.query("INSERT INTO users (email, password, peep_handle) VALUES('#{email}', '#{password}', '#{peep_handle}') RETURNING id, email, peep_handle;")
     User.new(id: result[0]['id'], email: result[0]['email'], handle: result[0]['peep_handle'])
   end
 end