

 feature 'See messages' do
  scenario 'user can see messages on the page' do
    connection = PG.connect(dbname: 'chitter_test') 
    Messages.create_message(name: 'Emily', message: 'We are learning how to build a full-stack application', peep_handle: 'lajoiedevivre89', timestamp: '05:30:07')
    Messages.create_message(name: 'Billy', message: 'From Monday we will no longer be the newest cohort', peep_handle: 'housemusic1', timestamp: '05:30:07')
    Messages.create_message(name: 'Jonas', message: 'Tweets sound better than peeps', peep_handle: 'popmusicrocks', timestamp: '05:30:07')
    visit '/index'
    expect(page).to have_content 'We are learning how to build a full-stack application' 
    expect(page).to have_content 'From Monday we will no longer be the newest cohort' 
    expect(page).to have_content 'Tweets sound better than peeps' 
  end
end