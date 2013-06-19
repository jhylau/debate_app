require 'spec_helper'

describe Debate do
  let(:debate) {FactoryGirl.build(:debate)}

  it {should validate_presence_of(:topic_id)}
  it {should belong_to(:topic)}
  it {should belong_to(:winner).class_name('User')}
  it {should have_many(:debate_sides)}
  it {should have_many(:users).through(:debate_sides)}
  it {should allow_mass_assignment_of(:topic_id)}
  it {should_not allow_mass_assignment_of(:winner_id)}

  it "stores new debate records" do
    previous_count = Debate.count
    3.times {FactoryGirl.create(:debate)}
    expect(Debate.all.count).to eq(3 + previous_count)
  end

  it "removes destroyed debate records" do
    3.times {FactoryGirl.create(:debate)}
    previous_count = Debate.count
    Debate.first.destroy
    expect(Debate.count).to eq(previous_count-1)
  end

  context 'has user method' do
    it 'should return true if the debate has one user' do
      debate = FactoryGirl.create(:debate)
      create_debate_sides_with_one_user(debate)
      expect(debate.has_one_user?).to be_true
    end

    it 'should return false if the debate does not have one user' do
      debate = FactoryGirl.create(:debate)
      create_debate_sides_with_users(debate)
      expect(debate.has_one_user?).to be_false
    end
  end
  
end
