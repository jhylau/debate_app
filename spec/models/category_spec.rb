require 'spec_helper'

describe Category do
  let(:category) {category = FactoryGirl.build(:category)}

  it {should allow_mass_assignment_of(:subtitle)}
  it {should allow_mass_assignment_of(:title)}
  it {should have_many(:topics)}
  it {should validate_presence_of(:title) }

   it "stores new category records" do
    3.times {FactoryGirl.create(:category)}
    expect(Category.all.count).to eq(3)
  end

  it "removes destroyed category records" do
    3.times {FactoryGirl.create(:category)}
    previous_count = Category.count
    Category.first.destroy
    expect(Category.all.count).to eq(previous_count-1)
  end

end
