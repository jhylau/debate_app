# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username "MyString"
    password "MyString"
    email "MyString"
    ranking 1
    debates_participated_in 1
    tournaments_won 1
  end
end
