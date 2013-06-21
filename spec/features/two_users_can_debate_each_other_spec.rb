require 'spec_helper'

describe "User participating in a debate" do
 let(:debate) {FactoryGirl.create(:debate)}
 let(:user1) {FactoryGirl.create(:user)}
 let(:user2) {FactoryGirl.create(:user)}

 before(:each) do
  debate_side_yes = FactoryGirl.create(:debate_side, debate: debate, side: 'yes', user: user1)
  debate_side_no = FactoryGirl.create(:debate_side, debate: debate, side: 'no')  
 end
 
 it 'allows two different user to join a debate' do
    in_browser(:one) do
      login_as(user1)
    end

    in_browser(:two) do
      login_as(user2)
      visit "/"
      click_on "Participate"
      click_on "read-#{debate.id}"
      click_on "join-no"
      expect(page).to have_content("#{user1.username}")
      expect(page).to have_content("#{user2.username}")
    end

  end
end
