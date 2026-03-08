FactoryBot.define do
  factory :experience do
    company_name { Faker::Company.name }
    experience_type { "work" }
  end
end