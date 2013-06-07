require 'spec_helper'

describe "User debates" do
  it "can submit an argument" do
    debate = FactoryGirl.create(:debate)
    visit '/'
    click_link('read more')
    fill_in 'Argument', :with => 'A stupid argument'
    click_link('submit argument')
    expect(page).to have_content('A stupid argument')
  end

  it 'can submit a comment'
  
end
