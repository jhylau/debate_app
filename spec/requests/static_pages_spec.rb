require 'spec_helper'
include Capybara::DSL

describe "Static pages" do
  
  describe "Home page" do
    before(:each) do
      FactoryGirl.create(:debate_side)
      visit '/'
    end
    it "should have the h1 'DebateMe' " do
      page.should have_selector('h1', :text => 'DebateMe')
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
