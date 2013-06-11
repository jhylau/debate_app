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

  it "can click on a read more button for a specific" do
    visit '/'
    first('.btn-small').click
    expect(page).to have_content('argument')
  end

  it 'can submit a comment' do
    visit '/'
    first('.btn-small').click
    fill_in 'comment', with: "Hello World!"
    click_on('Submit Comment')
    expect(page).to have_content("Hello World!")
  end 

  it 'can vote on yes side of a debate' do
    visit "/"
    first('.btn-small').click
    debate_side_yes = debate.debate_sides.where(side:"yes").first
    count = debate_side_yes.votes.count
    first('.btn-primary').click
    expect(page).to have_content("#{count + 1}")
  end

   it 'can vote on no side of a debate' do
    visit "/"
    first('.btn-small').click
    debate_side_yes = debate.debate_sides.where(side:"yes").first
    count = debate_side_yes.votes.count
    page.all('.btn-primary')[1].click
    expect(page).to have_content("#{count + 1}")
  end
end
