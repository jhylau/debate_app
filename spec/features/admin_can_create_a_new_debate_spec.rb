require 'spec_helper'

describe "Admin" do

  before(:each) {
    6.times do
      FactoryGirl.create(:debate_side)
    end
  }

  it "can submit a new debate topic and subtopic" do
    binding.pry
    visit "/"
    click_on "Create"
    fill_in 'Title', :with => 'A stupid topic'
    fill_in 'subtitle', :with => 'A stupid subtopic'
    save_and_open_page
    click_link('Create')
    expect(page).to have_content('DebateMe')
  end

  it 'can submit a comment' do
    
  end
  
end
