require 'spec_helper'

describe Comment do
   let(:comment) {comment = FactoryGirl.build(:comment)}

  it "validates that I have specified a content" do
    comment.content = nil
    expect(comment).to_not be_valid
  end

  it "validates that I have specified a user_id" do    
    comment.user_id = nil
    expect(comment).to_not be_valid
  end

  it "validates that I have specified an debate_side_id" do    
    comment.debate_side_id = nil
    expect(comment).to_not be_valid
  end

   it "stores new comment records" do
    3.times {FactoryGirl.create(:comment)}
    expect(Comment.all.count).to eq(3)
  end

  it "removes destroyed comment records" do
    3.times {FactoryGirl.create(:comment)}
    previous_count = Comment.count
    Comment.first.destroy
    expect(Comment.all.count).to eq(previous_count-1)
  end

end
