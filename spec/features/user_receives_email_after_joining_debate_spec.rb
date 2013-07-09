require 'spec_helper'

feature 'user receives email after joining debate', %q{
  As a user
  I want to receive an email after joining a debate
  So I am reminded that I joined
} do

  context 'as a user' do
    let(:user) { FactoryGirl.create(:user) }

    before :each do
      login_as user
    end

    scenario 'receive email after joining debate' do
      debate = FactoryGirl.create(:debate_with_sides)

      UserMailer.should_receive(:join_debate_email)

      visit debate_path(debate)
      click_on 'join-yes'
    end
  end
  
end
