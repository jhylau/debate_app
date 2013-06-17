require 'spec_helper'


  # User Story
  # As a prospective user
  # I want to view a debate
  # so I can learn more about political issues.


  #Acceptance Criteria:
  # * When I visit the home page, I can click read more on topics that I like.
  # * I can comment on the debate posts


describe "User views debate" do
  let(:debate) {FactoryGirl.create(:debate)}
  before(:each) do
    debate_side_yes = FactoryGirl.create(:debate_side, debate: debate, side: 'yes')
    debate_side_no = FactoryGirl.create(:debate_side, debate: debate, side: 'no')
  end

  before do
    login
  end

  it "can click on a read more button for a specific" do
    visit '/'
    click_on "read-#{debate.id}"
    expect(page).to have_content('argument')
  end

  it 'can vote on yes side of a debate' do
    visit "/"
    click_on "read-#{debate.id}"
    debate_side_yes = debate.debate_sides.where(side:"yes").first
    count = debate_side_yes.votes.count
    click_on "vote-yes"
    expect(page).to have_content("#{count + 1}")
  end

   it 'can vote on no side of a debate' do
    visit "/"
    click_on "read-#{debate.id}"
    debate_side_yes = debate.debate_sides.where(side:"yes").first
    count = debate_side_yes.votes.count
    click_on "vote-no"
    expect(page).to have_content("#{count + 1}")
  end
end
