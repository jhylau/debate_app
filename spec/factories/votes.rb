# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vote do
    debate_side_id 1
    user_id 1
  end
end
