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
    factory :debate_with_winner do
      association :winner, factory: :user
    end

    factory :debate_with_sides do
      after(:create) do |debate|
        FactoryGirl.create(:debate_side, side: 'yes', debate: debate)
        FactoryGirl.create(:debate_side, side: 'no', debate: debate)
      end
    end
  end

  factory :debate_side do
    vote_count  10
    side 'default'
    debate
    factory :debate_side_with_user do
      user
    end
 end

  factory :response do
    content 'text'
    debate_side
    response_type 'Argument'

    factory :argument do
      response_type 'Argument'
    end

    factory :rebuttal do
      response_type 'Rebuttal'
    end

    factory :conclusion do
      response_type 'Conclusion'
    end
  end

  factory :user do
    sequence(:username) {|n| "username#{n}" }
    sequence(:password) {|n| "password#{n}" }
    sequence(:email) {|n| "person#{n}@example.com" }
    ranking 1
    debates_participated_in 1
    tournaments_won 1
    role "user"

    factory :admin do
      role "admin"
    end
  end

  factory :vote do
    debate_side
    user
  end
end
