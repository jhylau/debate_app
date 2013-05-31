# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :debate_side do
    argument "MyText"
    rebuttal "MyText"
    conclusion "MyText"
    vote_count 1
    user_id "MyString"
    side "MyString"
    debate_id 1
  end
end
