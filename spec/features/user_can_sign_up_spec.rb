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

  let(:debate) {FactoryGirl.create(:debate)}

  before(:each) do
    create_debate_sides_with_users(debate)
  end
  
  it "can click on a sign up button on the home page" do
 
    visit '/'
    click_link('JOIN US')
    expect(page).to have_content('Sign up now')
  end

  it "can fill in information to sign up" do
    visit '/'
    click_link('JOIN US')
    fill_in 'Username', :with => 'string'
    fill_in 'Email', :with => 'string@string.com'
    fill_in 'user_password', :with => 'avalidstring'
    fill_in 'user_password_confirmation', :with => 'avalidstring'
    click_on 'Sign up'
    expect(page).to have_content("success")
  end

end
