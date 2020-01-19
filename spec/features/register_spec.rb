feature 'Register' do
   scenario 'a user can register a for an account' do
     visit ('/users/new')
     fill_in('email', with: 'emily@gmail.com')
     fill_in('password', with: 'coding')
     fill_in('peep_handle', with: 'lajoiedevivre89')
     click_button('Register')
     expect(page).to have_content 'You have successfuly registered for a Chitter account'
   end
 end