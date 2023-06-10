FactoryBot.define do
  factory :course do
    sequence(:name) { |n| "Course #{n}" }
    duration { Faker::Number.between(from: 1, to: 12) }
  end
end
