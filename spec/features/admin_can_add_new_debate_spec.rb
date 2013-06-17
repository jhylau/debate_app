require 'spec_helper'

describe 'adding a new debate' do

  context 'when an admin' do
    let(:admin) { FactoryGirl.create(:admin) }


    it 'shows a link for admin panel on indes page' do
      visit new_user_session_path
      fill_in "Email", with: admin.email
      fill_in 'Password', with: admin.password
      click_button 'Sign In'
      page.should have_link("Admin")
    end

    it "can submit a new debate topic and subtopic" do
      visit new_user_session_path  
      fill_in "Email", with: admin.email
      fill_in 'Password', with: admin.password
      click_button 'Sign In'

      FactoryGirl.create(:debate)
      click_on ("Admin")
      fill_in 'Title', :with => 'A stupid topic'
      fill_in 'subtitle', :with => 'A stupid subtopic'
      click_link('Create')
      expect(page).to have_content('DebateMe')
    end

  end
    
    context 'when a non-admin' do
    
      let(:user) { FactoryGirl.create(:user) }
      let(:debate) {FactoryGirl.create(:debate)}

      before(:each) do
        debate_side_yes = FactoryGirl.create(:debate_side, debate: debate, side: 'yes')
        debate_side_no = FactoryGirl.create(:debate_side, debate: debate, side: 'no')
      end

      it 'does not show a link for creating a task on the index page' do
        visit new_user_session_path
          
        fill_in "Email", with: user.email
        fill_in 'Password', with: user.password

        click_button 'Sign In'

        page.should_not have_link("Admin")  
      end

      it 'redirects back to index when attempting to access new topic form' do
        visit new_user_session_path

        fill_in "Email", with: user.email
        fill_in 'Password', with: user.password

        click_button 'Sign In'

        visit '/categories/new'
        page.should have_content("not authorized")
      end

    end


  
end
