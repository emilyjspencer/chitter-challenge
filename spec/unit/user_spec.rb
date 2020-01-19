require 'users'
require 'database_helpers'

 describe Users do

   describe '.create' do
     it 'creates a new user' do # user has an id, email, password and handle
       user = Users.create(email: 'emily@gmail.com', password: 'coding', peep_handle: 'lajoiedevivre89')
       persisted_data = persisted_data(table: :users, id: user.id) # data that is saved is
       expect(user).to be_a Users # expect it to be an instance of the User class
       expect(user.id).to eq persisted_data.first['id'] # return that particular id
       expect(user.email).to eq 'emily@gmail.com' # check that attr_reader id is indeed returning the correct email for test purposes 
     end
   
      it 'hides password using the BCrypt gem' do
        expect(BCrypt::Password).to receive(:create).with('coding')
        Users.create(email: 'emily@gmail.com', password: 'coding', peep_handle: 'lajoiedevivre89')
      end
   end 

   describe '.find_details' do
     it 'returns a users details when only their id is provided' do
       user = Users.create(email: 'emily@gmail.com', password: 'coding', peep_handle: 'lajoiedevivre89')
       result = Users.find_details(id: user.id)
       expect(result.id).to eq user.id
       expect(result.email).to eq 'emily@gmail.com'
     end

     it 'returns nil if no ID is provided' do
      expect(Users.find_details(id: nil)).to eq nil
     end
   end
 end