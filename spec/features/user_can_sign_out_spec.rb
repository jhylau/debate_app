require 'spec_helper'

describe "signing out" do
  let(:user) { FactoryGirl.create(:user) }

  context 'when a user is signed in' do
      it 'can sign out by clicking sign out' do
        visit new_user_session_path   
        fill_in "Email", with: user.email
        fill_in 'Password', with: user.password
        click_button 'Sign In'
        click_on 'Sign out'
        page.should have_content('Signed out successfully')
      end
  end
end
