# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  sequence :user do |n|
    n
  end

  sequence :debate_side do |n|
    n
  end

  factory :vote do
    debate_side_id {generate(:debate_side)}
    user_id {generate(:user)}
  end
end
