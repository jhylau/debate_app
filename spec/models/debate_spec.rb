require 'spec_helper'

describe Debate do
  let(:debate) {FactoryGirl.build(:debate)}

  it {should validate_presence_of(:topic_id)}
  it {should belong_to(:topic)}
  it {should belong_to(:winner)}

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

  it 'does not allow the same user to have '

end
