require 'spec_helper'

describe "User debates" do
  let(:debate) {FactoryGirl.create(:debate)}

  before(:each) do
    debate_side_yes = FactoryGirl.create(:debate_side, debate: debate, side: 'yes')
    debate_side_no = FactoryGirl.create(:debate_side, debate: debate, side: 'no')
  end

  before do
    login
  end

  it "can submit an argument" do
    visit "/debates/#{debate.id}"
    save_and_open_page
    fill_in 'yes_argument', with: 'some text'
    click_on 'submit_yes_argument'
    expect(page).to have_content('Some text')
  end

  it 'can find debates to participate in' do
    visit "/"
    click_on "Participate"
        save_and_open_page
    expect(page).to have "join'"
  end
  
  it 'can only join one side of a debate' do
    visit "/"

    click_on "read-#{debate.id}"
        save_and_open_page
    click_on 'join_yes'
    expect(lambda {click_on 'join_no'}).to_not be_valid
  end
end
