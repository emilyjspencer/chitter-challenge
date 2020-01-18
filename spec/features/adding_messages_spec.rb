feature 'Adding message' do
  scenario 'A user can add a message and see it on the page' do
    visit('/messages/new')
    fill_in('message', with: "My first message")
    click_button('Post')
    expect(page).to have_content("My first message")
  end
end 

