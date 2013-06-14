require 'spec_helper'

describe Vote do
  let(:vote) {FactoryGirl.build(:vote)}

  it {should validate_presence_of(:user_id)}
  it {should validate_presence_of(:debate_side_id)}
  it {should belong_to(:user)}  
  it {should belong_to(:debate_side)}

  it "stores new vote records" do
    previous_count = Vote.count
    3.times {FactoryGirl.create(:vote)}
    expect(Vote.all.count).to eq(3 + previous_count)
  end

  it "only allows each user to vote for each debate side once" do
  end

  it "removes destroyed vote records" do
    3.times {FactoryGirl.create(:vote)}
    previous_count = Vote.count
    Vote.first.destroy
    expect(Vote.all.count).to eq(previous_count-1)
  end
end
