require 'spec_helper'

describe User do
  let(:user) {FactoryGirl.build(:user)}
  
  it {should validate_presence_of(:password)}
  it {should validate_presence_of(:email)}
  it { should allow_value("a@b.com").for(:email) }
  it { should_not allow_value("blah").for(:email) }
  # it { should_not allow_mass_assignment_of(:password) }
  it { should allow_mass_assignment_of(:email) }
  it { should allow_mass_assignment_of(:password) }
  it { should allow_mass_assignment_of(:password_confirmation) }
  it { should allow_mass_assignment_of(:remember_me) }
  it { should allow_mass_assignment_of(:debates_participated_in) }
  it { should allow_mass_assignment_of(:ranking) }
  it { should allow_mass_assignment_of(:tournaments_won) }
  it { should allow_mass_assignment_of(:role) }
  
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
      admin.is_admin?.should be_true
    end
  end
end
