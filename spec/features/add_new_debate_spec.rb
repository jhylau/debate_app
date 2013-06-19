require 'spec_helper'

describe 'adding a new debate' do
  let(:debate) {FactoryGirl.create(:debate)}
  before(:each) do
    create_debate_sides_with_users(debate)
  end

  context 'when an admin' do
    let(:admin) { FactoryGirl.create(:admin) }  

    before(:each) do
      login_as(admin)
    end

    it 'shows a link for admin panel on index page when signed in as admin' do
      page.should have_link("Admin")
    end

    it "can submit a new debate topic and subtopic" do
      click_on ("Admin")
      fill_in 'Title', with: 'Topic'
      fill_in 'subtitle', with: 'subtopic'
      click_button 'Create'
      expect(page).to have_content('successfully created')
    end

    it 'can only submit titles with no spaces' do
      click_on ("Admin")
      fill_in 'Title', with: 'Topic Topic'
      fill_in 'subtitle', with: 'subtitle'
      click_button 'Create'
      expect(page).to have_content('not created')
    end

  end
    
    context 'when a regular_user' do
      let(:regular_user) { FactoryGirl.create(:user) }  

      before(:each) do
        login_as(regular_user)
      end

      it 'does not show a link for creating a task on the index page' do
        visit root_path
        page.should_not have_link("Admin")  
      end

      it 'redirects back to index when attempting to access new topic form' do
        visit '/categories/new'
        page.should have_content("not authorized")
      end

    end


  
end
