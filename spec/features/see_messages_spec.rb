

 feature 'See messages' do
  scenario 'user can see messages on the page' do
    connection = PG.connect(dbname: 'chitter_test') 
    connection.exec("INSERT INTO messages(message) VALUES ('We are learning how to build a full-stack application');") 
    connection.exec("INSERT INTO messages(message) VALUES ('From Monday we will no longer be the newest cohort');") 
    connection.exec("INSERT INTO messages(message) VALUES ('Tweets sound better than peeps');") 
    visit '/index'
    expect(page).to have_content 'We are learning how to build a full-stack application' 
    expect(page).to have_content 'From Monday we will no longer be the newest cohort' 
    expect(page).to have_content 'Tweets sound better than peeps' 
  end
end