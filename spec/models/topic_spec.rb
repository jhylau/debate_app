require 'spec_helper'

describe Topic do
  let(:topic) {FactoryGirl.create(:topic)}

  it {should validate_presence_of(:category_id)}
  it {should validate_presence_of(:subtitle)}
  it {should validate_presence_of(:title)}
  it {should belong_to(:category)}
  it {should ensure_length_of(:title).is_at_most(20)}
  it {should ensure_length_of(:subtitle).is_at_most(80)}
  it {should have_many(:debates)}
  it {should_not allow_value(" ").for(:title)}
  it {should allow_mass_assignment_of(:category_id)}
  it {should allow_mass_assignment_of(:subtitle)}
  it {should allow_mass_assignment_of(:title)}
  it {should allow_mass_assignment_of(:image)}
  
  it "stores new topic records" do
    previous_count = Topic.count
    3.times {FactoryGirl.create(:topic)}
    expect(Topic.count).to eq(3 + previous_count)
  end

  it "removes destroyed topic records" do
    3.times {FactoryGirl.create(:topic)}
    previous_count = Topic.count
    Topic.first.destroy
    expect(Topic.all.count).to eq(previous_count-1)
  end

  it 'allows photos to be uploaded' 

end
