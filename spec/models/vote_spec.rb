require 'spec_helper'

describe Vote do
  let(:vote) {FactoryGirl.build(:vote)}

  it {should validate_presence_of(:user_id)}
  it {should validate_presence_of(:debate_side_id)}
  it {should belong_to(:user)}  
  it {should belong_to(:debate_side)}
  it {should allow_mass_assignment_of(:user_id)}
  it {should allow_mass_assignment_of(:debate_side_id)}
  it {should validate_uniqueness_of(:debate_side_id).scoped_to(:user_id).with_message("can only have one vote per user")}

  it "stores new vote records" do
    previous_count = Vote.count
    3.times {FactoryGirl.create(:vote)}
    expect(Vote.all.count).to eq(3 + previous_count)
  end

  it 'validates uniqueness of user in the votes for each debate' do
    debate = FactoryGirl.create(:debate)
    user = FactoryGirl.create(:user)
    create_debate_sides_with_users(debate)
    debate.debate_sides.where(side: 'yes').first.votes.create!(user_id: user.id)
    new_vote = debate.debate_sides.where(side: 'no').first.votes.new(user_id: user.id)
    new_vote.should have(1).errors_on(:uniqueness_error)
  end

  it "removes destroyed vote records" do
    3.times {FactoryGirl.create(:vote)}
    previous_count = Vote.count
    Vote.first.destroy
    expect(Vote.all.count).to eq(previous_count-1)
  end
end
