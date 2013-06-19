require 'spec_helper'

describe "User participating in a debate" do
 let(:debate) {FactoryGirl.create(:debate)}

 let(:user) {FactoryGirl.create(:user)}
 
 before(:each) do
    login_as(user)
  end

  context 'participating in existing debate as a debater' do
    before(:each) do
      create_debate_sides_with_users(debate)
    end
    
    it 'cannot submit an argument if it is not the debater for the debate'

    it "can submit an argument" do
      visit "/debates/#{debate.id}"
      fill_in 'yes-argument', with: 'some text'
      click_on 'submit-yes-argument'
      expect(page).to have_content('some text')
    end

    it "can submit a rebuttal" do
      visit "/debates/#{debate.id}"
      fill_in 'yes-rebuttal', with: 'some text'
      click_on 'submit-yes-rebuttal'
      expect(page).to have_content('some text')
    end

    it "can submit a conclusion" do
      visit "/debates/#{debate.id}"
      fill_in 'yes-argument', with: 'some text'
      click_on 'submit-yes-argument'
      expect(page).to have_content('some text')
    end
  end
end
