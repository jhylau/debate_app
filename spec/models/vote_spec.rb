require 'spec_helper'

describe Vote do
  let(:vote) {vote = FactoryGirl.build(:vote)}

  it "validates that I have specified a debate_side_id" do
    vote.debate_side_id = nil
    expect(vote).to_not be_valid
  end

  it "validates that I have specified a user_id" do    
    vote.user_id = nil
    expect(vote).to_not be_valid
  end

  it "stores new vote records" do
    3.times {FactoryGirl.create(:vote)}
    expect(Vote.all.count).to eq(3)
  end

  it "removes destroyed vote records" do
    3.times {FactoryGirl.create(:vote)}
    previous_count = Vote.count
    Vote.first.destroy
    expect(Vote.all.count).to eq(previous_count-1)
  end
end
