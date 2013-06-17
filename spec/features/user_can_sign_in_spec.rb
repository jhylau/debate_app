require 'spec_helper'

describe "visiting the home page" do
  context 'when a user is not signed in' do
      it 'stays on home page' do
        visit root_path
        save_and_open_page
         page.should have_content("The world's most important political debates")
      end
  end

  context 'user forgot password' do
    
  end
end
