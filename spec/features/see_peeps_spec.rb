feature 'See Peeps' do
   scenario 'the user can see all peeps on the page' do
     visit '/index'
     expect(page).to have_content 'We are learning how to build a full-stack application'
     expect(page).to have_content 'From Monday we will no longer be the newest cohort' 
     expect(page).to have_content 'Tweets sounds better than Peeps'
   end
 end