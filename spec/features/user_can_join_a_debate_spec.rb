require 'spec_helper'

describe "User can join a debate" do
 let(:debate) {FactoryGirl.create(:debate)}

 let(:user) {FactoryGirl.create(:user)}
 
 before(:each) do
    login_as(user)
  end

  context 'joining a new debate without users' do 
    before(:each) do
      create_debate_sides_with_one_user(debate)
    end

    it 'can find debates to participate in' do
      visit "/"
      click_on "Challenge"
      click_on "read-#{debate.id}"
      click_on "join-no"
      expect(page).to have_content('username')
    end

    it 'can only join one side of a debate' do
      t = Topic.all.last
      visit "/"
      click_on "Create"
      click_on "create-#{t.id}"
      click_on "join-yes"
      expect(page).to have_content "Waiting for contestant"
    end
  end

end
