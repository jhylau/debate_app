require 'spec_helper'
include Capybara::DSL

describe "Static pages" do
  
  describe "Home page" do
    let(:user) { FactoryGirl.create(:user) }
    let(:debate) {FactoryGirl.create(:debate)}

    before(:each) do
      debate_side_yes = FactoryGirl.create(:debate_side, debate: debate, side: 'yes')
      debate_side_no = FactoryGirl.create(:debate_side, debate: debate, side: 'no')
    end

    it "should have the h1 'DebateMe' " do
      visit "/"
      response.body.should have_css("h1", text: 'DebateMe')
    end

  end
  
  # describe "About page" do
  #   before(:each) do
  #     visit about_path
  #   end

  #   it "should have the h1 'About Us' " do
  #     page.should have_selector('h1', :text => 'About Us')
  #   end
  # end
end
