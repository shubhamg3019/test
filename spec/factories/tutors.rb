FactoryBot.define do
  factory :tutor do
    sequence(:name) { |n| "Tutor #{n}" }
    specialization { Faker::Educator.course }
    course
  end
end
