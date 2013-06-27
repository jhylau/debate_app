require 'spec_helper'

describe Vote do
  let(:vote) {FactoryGirl.build(:vote)}

  it {should belong_to(:user)}  
  it {should belong_to(:debate_side)}
  it {should allow_mass_assignment_of(:user_id)}
  it {should allow_mass_assignment_of(:debate_side_id)}
  # it {should validate_uniqueness_of(:debate_side_id).scoped_to(:user_id).with_message("can only have one vote per user")}

end
