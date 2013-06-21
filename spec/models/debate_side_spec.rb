require 'spec_helper'

describe DebateSide do
  it {should belong_to(:debate)}
  it {should have_many(:votes)}
  it {should belong_to(:user)}
  it {should validate_presence_of(:debate_id)}
  it {should validate_presence_of(:side)}
  it {should validate_uniqueness_of(:user_id).scoped_to(:debate_id)}
  it {should have_many(:responses)}
  it {should allow_mass_assignment_of(:vote_count)}
  it {should_not allow_mass_assignment_of(:debate_id)}
  it {should_not allow_mass_assignment_of(:user_id)}  
 
  context 'has user method' do
    it 'should return true if the debateside has a user' do
      debate_side = FactoryGirl.create(:debate_side_with_user)
      expect(debate_side.has_user?).to be_true
    end

    it 'should return false if the debateside has a user' do
      debate_side = FactoryGirl.create(:debate_side)
      expect(debate_side.has_user?).to be_false
    end 
  end

end
