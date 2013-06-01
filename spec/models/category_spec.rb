require 'spec_helper'

describe Category do
  let(:category) {category = FactoryGirl.build(:category)}

  it "validates that I have specified a title" do
    category.title = nil
    expect(category).to_not be_valid
  end

  it "validates that I have specified a subtitle" do    
    category.subtitle = nil
    expect(category).to_not be_valid
  end

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
