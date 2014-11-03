FactoryGirl.define do
  factory :question do
    sequence(:title) {|n| "questions#{n}" }
    content "this is a question"
  end
  factory :answer do
    sequence(:title) {|n| "answer#{n}" }
    content "this is a answer"
  end
end