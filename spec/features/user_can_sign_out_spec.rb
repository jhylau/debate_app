require 'spec_helper'

describe "signing out" do
  context 'when a user is signed in' do
      it 'can sign out by clicking sign out' do
        visit root_path
        page.should redirect_to(sign_in_path)
      end
  end
end
