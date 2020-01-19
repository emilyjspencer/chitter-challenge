require 'database_connection'

 describe DatabaseConnection do

   describe '.establish_connection' do
     it 'establishes a connection to the database through PG' do
       expect(PG).to receive(:connect).with(dbname: 'chitter_test')
       DatabaseConnection.establish_connection('chitter_test')
     end
   end

   describe '.query' do
     it 'executes a query via PG' do
       connection = DatabaseConnection.establish_connection('chitter_test')
       expect(connection).to receive(:exec).with("SELECT * FROM messages;")
       DatabaseConnection.query("SELECT * FROM messages;")
     end
   end
 end