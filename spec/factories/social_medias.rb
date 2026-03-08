FactoryBot.define do
  factory :social_media do
    name { Faker::Internet.username }
    url { Faker::Internet.url }
    position { 1 }
  end
end