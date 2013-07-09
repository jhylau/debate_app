require 'spec_helper'

feature 'user can view profile page', %q{
  As a registered user
  I want to be able to view my profile page
  so I can keep track of my debates and scores
} do

  let(:user) {FactoryGirl.create(:user)}
 
  before(:each) do
    login_as(user)
  end
  
  scenario 'user can navigate to profile page' do
    visit '/'
    click_on "#{user.username}'s Profile"
    expect(page).to have_content("Profile")
  end

  scenario 'user can see the list of debates they are in' do
    debate_sides = FactoryGirl.create_list(:debate_side, 3, user: user)

    visit profile_path(user)

    debate_sides.each do |side|
      debate = side.debate
      expect(page).to have_link(debate.topic.title, debate_path(debate))
    end
  end
end
