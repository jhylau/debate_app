require 'spec_helper'

describe "User debates" do
  include Devise::TestHelpers

  before (:each) do
    @user = Factory.create(:user)
    sign_in @user
  end

  let(:debate) {FactoryGirl.create(:debate)}

  before(:each) do
    debate_side_yes = FactoryGirl.create(:debate_side, debate: debate, side: 'yes')
    debate_side_no = FactoryGirl.create(:debate_side, debate: debate, side: 'no')
  end

  it "can submit an argument" do
    visit "/"
    page.all('.btn-small')[0].click
    first(:css,"#debate_side_argument").set('Some text')
    page.all('.btn')[2].click
    expect(page).to have_content('Some text')
  end

  it 'can find debates to participate in' do
    visit "/"
    click_on "Participate"
    click_on "read more"
    expect(page).to have "vs."
  end
  
  it 'can only join one side of a debate' do
    visit "/"
    click_on 'read-1'
    click_on 'join_yes'
    page.should_not have_content 'You can only join one side!'
  end
end
