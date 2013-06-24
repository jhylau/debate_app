require 'spec_helper'

feature 'debater can submit a response', %q{
  As a registered user
  I want to be able to submit a response
  so I can voice my opinions about issues that I care about.
} do

  # Acceptance Criteria:
  # There is a form for submitting a response
  # Submitting the response will show it on the debate page
  # The form requires a response body
  context 'as a guest' do
    scenario 'going to debate path will redirect you to sign up page'
  end

  context 'as a registered user' do
    let(:user) { FactoryGirl.create(:user) }

    scenario 'submitting a response shows it on the debate page' do
      debate = FactoryGirl.create(:debate)
      debate_side_yes = FactoryGirl.create(:debate_side, side: 'yes', debate: debate, user: user)
      debate_side_no = FactoryGirl.create(:debate_side, side: 'no', debate: debate)

      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign In'

      visit debate_path(debate)

      fill_in 'Argument', with: 'foo bar baz'
      click_button 'Submit'

      page.should have_content('foo bar baz')
      page.should have_content('successfully submitted response')
      response = debate_side_yes.responses.first
      response.content.should == 'foo bar baz'
      response.response_type.should == 'Argument' 
    end

    scenario 'submitting empty form displays error'
    scenario 'only the debater of that debate side can view the form'



  end
 

end
