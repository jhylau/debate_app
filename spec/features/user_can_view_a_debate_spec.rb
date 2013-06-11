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

  it 'can submit a comment' do
    debate = FactoryGirl.create(:debate)
    visit '/'
    click_link('read more')
    fill_in 'comment', with: "Hello World!"
    click_on('Submit Comment')
    expect(page).to have_content("Hello World!")
  end 

  it 'can vote on yes side of a debate' do
    debate = FactoryGirl.create(:debate)
    visit "/debates/#{debate.id}"
    before = debate.votes.count
    click_link('vote_yes')
    expect(page).to have_content("#{before + 1}")
  end

   it 'can vote on no side of a debate' do
    debate = FactoryGirl.create(:debate)
    visit "/debates/#{debate.id}"
    before = debate.votes.count
    click_link('vote_no')
    expect(page).to have_content("#{before + 1}")
  end
end
