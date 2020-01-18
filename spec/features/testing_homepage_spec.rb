feature 'Testing homepage' do
   scenario 'Words appear on the homepage' do
     visit ('/')
     expect(page).to have_content 'Chitter - for all your Chatter' 
   end
 end