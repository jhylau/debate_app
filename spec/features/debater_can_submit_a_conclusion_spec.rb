require 'spec_helper'

feature 'debater can submit a conclusion', %q{
  As a registered user
  I want to be able to submit a conclusion after someone's rebuttal
  so I can critique his rebuttal.
} do

  # Acceptance Criteria:
  # There is a form for submitting a conclusion
  # Submitting the conclusion will show on debate page under rebuttal
  # The form requires a response body

  context 'as a debater' do
    let(:negative_debater) { FactoryGirl.create(:user) }
    let(:affirmative_debater) { FactoryGirl.create(:user) }

    scenario 'submitting a response shows it on the debate page' do
      debate = FactoryGirl.create(:debate)
      debate_side_yes = FactoryGirl.create(:debate_side, side: 'yes', debate: debate, user: affirmative_debater)
      debate_side_no = FactoryGirl.create(:debate_side, side: 'no', debate: debate, user: negative_debater)
      
      FactoryGirl.create(:response, response_type: 'Argument', debate_side: debate_side_yes, content:'abc')
      FactoryGirl.create(:response, response_type: 'Argument', debate_side: debate_side_no, content:'abc2')
      FactoryGirl.create(:response, response_type: 'Rebuttal', debate_side: debate_side_yes, content:'abcd')
      FactoryGirl.create(:response, response_type: 'Rebuttal', debate_side: debate_side_no, content:'abcd2')
      
      visit new_user_session_path
      fill_in 'Email', with: negative_debater.email
      fill_in 'Password', with: negative_debater.password
      click_button 'Sign In'
      visit debate_path(debate)
      save_and_open_page
      within('.yes-side') do
        fill_in 'Conclusion', with: 'foo bar baz'
        click_button 'Submit'
      end

      page.should have_content('abc')
      page.should have_content('foo bar baz')
      page.should have_content('successfully submitted response')
      response = debate_side_yes.responses.where(response_type: 'conclusion').first
      response.content.should == 'foo bar baz'
      response.response_type.should == 'conclusion'
    end

    scenario 'submitting empty form displays error'
    scenario 'only the debater of that debate side can view the form'



  end
 

end
