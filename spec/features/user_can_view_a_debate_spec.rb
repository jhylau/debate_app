require 'spec_helper'


  # User Story
  # As a prospective user
  # I want to view a debate
  # so I can learn more about political issues.


  #Acceptance Criteria:
  # * When I visit the home page, I can click read more on topics that I like.
  # * I can comment on the debate posts


describe "User views debate" do
  it "can click on a read more button for a specific" do
    debate = FactoryGirl.create(:debate)
    visit '/'
    click_link('read more')
    expect(page).to have_content('For')
  end

  it 'can submit a comment'
  
end