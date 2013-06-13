require 'spec_helper'

describe User do
  let(:user) {FactoryGirl.build(:user)}
  
  it {should validate_presence_of(:password)}
  it {should validate_presence_of(:email)}

  it "stores new user records" do
    previous_count = User.count
    3.times {FactoryGirl.create(:user)}
    expect(User.all.count).to eq(3 + previous_count)
  end

  it "removes destroyed user records" do
    3.times {FactoryGirl.create(:user)}
    previous_count = User.count
    User.first.destroy
    expect(User.all.count).to eq(previous_count-1)
  end

  it 'has an role attribute' do
    should ensure_inclusion_of(:role).in_array(%w(user admin))
  end

  describe "#is_admin?" do
    it "checks the role for admin privileges" do
      admin = FactoryGirl.create(:admin)
      admin.admin?.should be_true
    end
  end
end
