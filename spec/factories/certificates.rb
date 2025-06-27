FactoryBot.define do
  factory :certificate do
    title { Faker::Educator.course }
    subtitle { "Certification" }
    alt_name { Faker::Company.name }
    certificate_link { Faker::Internet.url }
    color_code { "#FFAA11" }
    position { 1 }
  end
end