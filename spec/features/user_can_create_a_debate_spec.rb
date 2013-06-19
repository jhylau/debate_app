require 'spec_helper'

describe "User can create a new debate based off existing topics" do
 let(:debate) {FactoryGirl.create(:debate)}
 let(:topic) {Topic.all.last}
 let(:user) {FactoryGirl.create(:user)}
 
 before(:each) do
    login_as(user)
  end

  context 'creating a new debate without users' do 
    before(:each) do
      create_debate_sides_with_one_user(debate)
    end

    it 'can create debates to participate in' do
      visit "/"
      click_on "Create"
      click_on "create-#{topic.id}"
      click_on "join-no"
      expect(page).to have_content(user.username)
    end
  end

end
