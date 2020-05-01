feature 'User authentication' do
   it 'a user can log in with the correct credentials' do
     Users.create(email: 'emily@gmail,com', password: 'coding', peep_handle: 'lajoiedevivre89')
     visit('/sessions/new')
     fill_in('email', with: 'emily@gmail.com')
     fill_in('password', with: 'coding')
     click_button('Sign in')
     visit('/messages')
     expect(page).to have_content 'Welcome to Chitter lajoiedevivre89'
   end


   it 'flashes an error if the user enters incorrect credentials' do
     Users.create(email: 'emily@gmail.com', password: 'coding', peep_handle: 'lajoiedevivre89')
     visit('/sessions/new')
     fill_in('email', with: 'emilu@gmail.com')
     fill_in('password', with: 'coding')
     click_button('Sign in')
     expect(page).not_to have_content 'Welcome to Chitter lajoiedevivre89'
     expect(page).to have_content 'Email or password incorrect. Unable to sign in'
   end 
 end