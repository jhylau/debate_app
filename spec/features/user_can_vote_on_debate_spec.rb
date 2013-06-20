require 'spec_helper'

describe "User can vote on a debate" do
 let(:debate) {FactoryGirl.create(:debate)}

 let(:user) {FactoryGirl.create(:user)}
 
 before(:each) do
    login_as(user)
  end

  context 'when viewing a debate' do 
    before(:each) do
      create_debate_sides_with_users(debate)
    end

    it 'can vote on one side of a debate' do
      visit "/"
      click_on "read-#{debate.id}"
      initial_number = page.find("#votes-no").text.to_i
      click_on "vote-no"
      expect(page.find_by_id("votes-no")).to have_content("#{initial_number+1}")
    end

    it 'can vote on one side of a debate' do
      visit "/"
      click_on "read-#{debate.id}"
      initial_number = page.find("#votes-no").text.to_i
      click_on "vote-no"
      click_on "vote-no"
      expect(page.find_by_id("votes-no")).to have_content("#{initial_number+1}")
    end

    it 'can only vote on one side of a debate' do
      visit "/"
      click_on "read-#{debate.id}"
      click_on "vote-no"
      initial_number = page.find("#votes-yes").text.to_i
      click_on "vote-yes"
      expect(page.find_by_id("votes-yes")).to have_content("#{initial_number}")
    end
  end

end
