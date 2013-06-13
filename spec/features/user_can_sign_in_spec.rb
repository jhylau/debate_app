require 'spec_helper'

describe "visiting the home page" do
  context 'when a user is not signed in' do
      it 'redirects to the sign in page' do
        visit root_path
        page.should redirect_to(sign_in_path)
      end
  end

  context 'user forgot password' do
    
  end
end
