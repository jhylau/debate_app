require 'spec_helper'

describe "User views debate" do
  let(:debate) {FactoryGirl.create(:debate)}
  let(:user) {FactoryGirl.create(:user)}
  before(:each) do
      create_debate_sides_with_users(debate)
  end

  before do
    login_as(user)
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
