#feature 'See messages' do
   #scenario 'the user can see all the messages on the page' do
     #visit '/index'
     #expect(page).to have_content 'We are learning how to build a full-stack application'
     #expect(page).to have_content 'From Monday we will no longer be the newest cohort' 
     #expect(page).to have_content 'Tweets sound better than peeps'
   #end
 #end


 feature 'See messages' do
  scenario 'user can see messages on the page' do
    connection = PG.connect(dbname: 'chitter_test') # connect to the test databaseß
    connection.exec("INSERT INTO messages(message) VALUES ('We are learning how to build a full-stack application');") # add test1 message to db
    connection.exec("INSERT INTO messages(message) VALUES ('From Monday we will no longer be the newest cohort');") # add test2 message to db
    connection.exec("INSERT INTO messages(message) VALUES ('Tweets sound better than peeps');") # add test3 message to db
    visit '/index'
    expect(page).to have_content 'We are learning how to build a full-stack application' # expect test1 message to have been retrieved and displayed
    expect(page).to have_content 'From Monday we will no longer be the newest cohort' # expect test2 message to have been retrieved and displayed
    expect(page).to have_content 'Tweets sound better than peeps' # expect test3 message to have been retrieved and displayed
  end
end