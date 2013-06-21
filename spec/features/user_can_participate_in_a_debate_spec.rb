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

   
  end
end
