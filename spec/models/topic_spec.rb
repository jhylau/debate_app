require 'spec_helper'

describe Topic do
  let(:topic) {FactoryGirl.create(:topic)}

  it "validates that I have specified a category_id" do
    topic.category_id = nil
    expect(topic).to_not be_valid
  end

  it "validates that I have specified a subtitle" do    
    topic.subtitle = nil
    expect(topic).to_not be_valid
  end

  it "validates that I have specified an title" do    
    topic.title = nil
    expect(topic).to_not be_valid
  end

   it "stores new topic records" do
    3.times {FactoryGirl.create(:topic)}
    expect(Topic.count).to eq(3)
  end

  it "removes destroyed topic records" do
    3.times {FactoryGirl.create(:topic)}
    previous_count = Topic.count
    Topic.first.destroy
    expect(Topic.all.count).to eq(previous_count-1)
  end
end
