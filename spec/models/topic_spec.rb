require 'spec_helper'

describe Topic do
  let(:topic) {FactoryGirl.create(:topic)}

  it {should validate_presence_of(:category_id)}
  it {should validate_presence_of(:subtitle)}
  it {should validate_presence_of(:title)}
  it {should belong_to(:category)}

   it "stores new topic records" do
    previous_count = Topic.count
    3.times {FactoryGirl.create(:topic)}
    expect(Topic.count).to eq(3 + :topic)
  end

  it "removes destroyed topic records" do
    3.times {FactoryGirl.create(:topic)}
    previous_count = Topic.count
    Topic.first.destroy
    expect(Topic.all.count).to eq(previous_count-1)
  end
end
