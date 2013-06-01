require 'spec_helper'

describe User do
  let(:user) {user = FactoryGirl.build(:user)}

  it "validates that I have specified a username" do
    user.username = nil
    expect(user).to_not be_valid
  end

  it "validates that I have specified a password" do    
    user.password = nil
    expect(user).to_not be_valid
  end

  it "validates that I have specified an email" do    
    user.email = nil
    expect(user).to_not be_valid
  end

  it "stores new user records" do
    3.times {FactoryGirl.create(:user)}
    expect(User.all.count).to eq(3)
  end

  it "removes destroyed user records" do
    3.times {FactoryGirl.create(:user)}
    previous_count = User.count
    User.first.destroy
    expect(User.all.count).to eq(previous_count-1)
  end

end
