

 feature 'See messages' do
  scenario 'user can see messages on the page' do
    visit ('/users/new')
     fill_in('email', with: 'emily@gmail.com')
     fill_in('password', with: 'coding')
     fill_in('peep_handle', with: 'lajoiedevivre89')
     click_button('Register')
    connection = PG.connect(dbname: 'chitter_test') 
    user = Users.create(email: 'emily@gmail.com', peep_handle: 'lajoiedevivre89', password: '12345')
    Messages.create_message(message: 'We are learning how to build a full-stack application', user_id: user.id)
    visit '/messages'
    expect(page).to have_content 'We are learning how to build a full-stack application' 
  end
end