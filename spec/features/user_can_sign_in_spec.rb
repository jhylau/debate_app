require 'spec_helper'

describe "visiting the home page" do
  context 'when a user is not signed in' do
      it 'stays on home page' do
        visit root_path
        page.should have_content("The world's most important political debates")
      end

      it 'gets redirected to signin when viewing a debate' do
        visit root_path
        click_on 'Challenge'
        page.should have_content("You need to sign in or sign up before continuing")
      end
  end

  context 'user forgot password' do
    
  end
end
