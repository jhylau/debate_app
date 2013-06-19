require 'spec_helper'

describe DebateSide do
  it {should belong_to(:debate)}
  it {should validate_presence_of(:debate_id)}
  it {should validate_presence_of(:side)}
  it {should validate_uniqueness_of(:user_id).scoped_to(:debate_id)}
end
