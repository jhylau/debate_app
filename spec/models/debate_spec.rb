require 'spec_helper'

describe Debate do
  let(:debate) {FactoryGirl.build(:debate)}

  it "validates that I have specified a topic_id" do
    debate.topic_id = nil
    expect(debate).to_not be_valid
  end

   it "stores new debate records" do
    3.times {FactoryGirl.create(:debate)}
    expect(Debate.all.count).to eq(3)
  end

  it "removes destroyed debate records" do
    3.times {FactoryGirl.create(:debate)}
    previous_count = Debate.count
    Debate.first.destroy
    expect(Debate.all.count).to eq(previous_count-1)
  end

end
