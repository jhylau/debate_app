require 'spec_helper'

describe "User debates" do
  it "can submit an argument" do
    debate = FactoryGirl.create(:debate)
    debate_side_1 = FactoryGirl.create(:debate_side, debate: debate, side: 'For')
    debate_side_2 = FactoryGirl.create(:debate_side, debate: debate, side: 'Against')
    visit "/debates/#{debate.id}"
    fill_in 'Argument', :with => 'A stupid argument'
    click_link('submit argument')
    expect(page).to have_content('A stupid argument')
  end

  it 'can submit a comment' do
    
  end
  
end
