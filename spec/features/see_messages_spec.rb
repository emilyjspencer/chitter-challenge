feature 'See messages' do
   scenario 'the user can see all the messages on the page' do
     visit '/index'
     expect(page).to have_content 'We are learning how to build a full-stack application'
     expect(page).to have_content 'From Monday we will no longer be the newest cohort' 
     expect(page).to have_content 'Tweets sound better than peeps'
   end
 end