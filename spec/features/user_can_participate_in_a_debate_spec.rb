require 'spec_helper'

describe "User participating in a debate" do
 let(:debate) {FactoryGirl.create(:debate)}

 let(:user) {FactoryGirl.create(:user)}
 
 before(:each) do
    login_as(user)
  end

  context 'participating in existing debate with users' do
    before(:each) do
      create_debate_sides_with_users(debate1)
    end

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

  context 'participating in a new debate without users' do 
    before(:each) do
      create_debate_sides_with_one_user(debate)
    end

    it 'can find debates to participate in' do
      visit "/"
      click_on "Participate"
      click_on "read-#{debate.id}"
      click_on "join-no"
      expect(page).to have_content('username')
    end

    it 'can only join one side of a debate' do
      t = Topic.all.last
      visit "/"
      click_on "Create"
      save_and_open_page
      click_on "create-#{t.id}"
      click_on "join-yes"
      expect(page).to have_content "Waiting for contestant"
    end
  end

end
