require 'spec_helper'

describe Comment do
   let(:comment) {FactoryGirl.build(:comment)}

  it {should validate_presence_of(:content)}
  it {should validate_presence_of(:user_id)}
  it {should validate_presence_of(:debate_side_id)}
  
   it "stores new comment records" do
    previous_count = Comment.count
    3.times {FactoryGirl.create(:comment)}
    expect(Comment.all.count).to eq(previous_count + 3)
  end

  it "removes destroyed comment records" do
    3.times {FactoryGirl.create(:comment)}
    previous_count = Comment.count
    Comment.first.destroy
    expect(Comment.all.count).to eq(previous_count-1)
  end

end
