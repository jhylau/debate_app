require 'spec_helper'

feature 'user sends feedback email via form', %q{
  As a user
  I want to send an email
  So I can provide feedback for the organizers
} do

  context 'as a user' do
    let(:user) {FactoryGirl.create(:user) }

    before :each do
      login_as user
    end

    scenario 'receive email after joining debate' do
      UserMailer.should_receive(:feedback_email)
      visit about_index_path
      fill_in 'feedback_content', :with => 'A bunch of stuff.'
      click_on 'submit'
    end
  end
  
end
