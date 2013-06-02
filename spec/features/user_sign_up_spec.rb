require 'spec_helper'

describe "User" do
  it "can click on a sign up button on the home page" do
    visit '/'
    click_link('JOIN NOW')
    expect(page).to have_content('Signup Here!')
  end

  it "can fill in information to sign up" do
    visit '/signup'
    fill_in 'First name', :with => 'string'
    fill_in 'Last name', :with => 'string'
    fill_in 'Email', :with => 'string'
    fill_in 'Password', :with => 'string'
    click_on 'Create Account'
    expect(page).to have_content('successfully created')
  end

end
