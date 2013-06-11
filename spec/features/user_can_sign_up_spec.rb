require 'spec_helper'

  # User Story
  # As a prospective user
  # I want to register
  # So that I can share my comments, reply, and vote


  #Acceptance Criteria:
  # * When I register, it logs that I've signed in
  # * When I register I am signed in
  # * I must specify a valid email, login, password and password confirmation

describe "User" do
  it "can click on a sign up button on the home page" do
    FactoryGirl.create(:debate_side)
    visit '/'
    click_link('JOIN US')
    expect(page).to have_button('Sign Up')
  end

  it "can fill in information to sign up" do
    visit '/signup'
    fill_in 'Username', :with => 'string'
    fill_in 'Email', :with => 'string'
    fill_in 'Password', :with => 'string'
    #click_on 'Sign Up'
    #expect content success
  end

end
