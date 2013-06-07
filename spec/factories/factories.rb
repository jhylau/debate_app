FactoryGirl.define do

  factory :category do
    title "MyString"
    subtitle "MyString"
  end

  factory :comment do
    debate_side 
    user
    content "MyText"
  end

  factory :topic do
    title "MyString"
    subtitle "MyString"
    category
  end

  factory :debate do
    topic
    association :winner, factory: :user
  end

  factory :debate_side do
    argument  "argument"
    rebuttal    "rebuttal"
    conclusion    "conclusion"
    vote_count  10
    side 'for'
    debate
 end

   factory :user do
    username "MyString"
    password "MyString"
    email "MyString"
    ranking 1
    debates_participated_in 1
    tournaments_won 1
  end

  factory :vote do
    debate_side
    user
  end
end
