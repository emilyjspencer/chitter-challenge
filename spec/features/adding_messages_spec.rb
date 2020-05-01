feature 'Adding message' do
  scenario 'A user can add a message and see it on the page' do
    visit '/'
    click_button('Click here to sign up for a Chitter account')
    visit '/users/new'
    fill_in('email', with: 'emily@gmail.com')
    fill_in('peep_handle', with: 'emilyjane')
    fill_in('password', with: '12345')
    click_button('Register')
    visit('/messages')
    fill_in('message', with: 'My first message')
    click_button('Submit')
    expect(page).to have_content('My first message')
  end

  scenario 'a user can see a submit button on their messages page' do
    visit '/'
    click_button('Click here to sign up for a Chitter account')
    visit '/users/new'
    fill_in('email', with: 'emily@gmail.com')
    fill_in('peep_handle', with: 'emilyjane')
    fill_in('password', with: '12345')
    click_button('Register')
    visit('/messages')
    expect(page).to have_button 'Submit'
  end
end 



