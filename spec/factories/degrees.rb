FactoryBot.define do
  factory :degree do
    title { "B.Tech" }
    subtitle { "Computer Science" }
    alt_name { "Engineering" }
    start_date { Date.today - 4.years }
    end_date { Date.today }
    description { Faker::Lorem.paragraph }
    position { 1 }
    website_link { Faker::Internet.url }
  end
end