require 'spec_helper'

describe "User participating in a debate" do
  let(:debate) {FactoryGirl.create(:debate)}

  before(:each) do
    debate_side_yes = FactoryGirl.create(:debate_side, debate: debate, side: 'yes')
    debate_side_no = FactoryGirl.create(:debate_side, debate: debate, side: 'no')
  end

  before do
    login
  end

  context 'participating in an argument' do
    it "can submit an argument" do
      visit "/debates/#{debate.id}"
      fill_in 'yes-argument', with: 'some text'
      click_on 'submit-yes-argument'
      expect(page).to have_content('some text')
    end

    it "can submit an argument" do
      visit "/debates/#{debate.id}"
      fill_in 'yes-argument', with: 'some text'
      click_on 'submit-yes-argument'
      expect(page).to have_content('some text')
    end

    it "can submit a conclusion" do
      visit "/debates/#{debate.id}"
      fill_in 'yes-argument', with: 'some text'
      click_on 'submit-yes-argument'
      expect(page).to have_content('some text')
    end
  end

  
  context 'new debate' do
    it 'can find debates to participate in' do
      visit "/"
      click_on "Participate"
      save_and_open_page
      click_on "read-#{debate.id}"
      expect(page).to have "join'"
    end

    it 'can join a debate' do
      visit "/"
      click_on "read-#{debate.id}"
      save_and_open_page
      click_on 'join-yes'
      expect(lambda{click_on 'join_no'}).to_not be_valid
    end
  end
end
