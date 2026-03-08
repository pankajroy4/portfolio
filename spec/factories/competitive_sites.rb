FactoryBot.define do
  factory :competitive_site do
    site_name { "LeetCode" }
    iconify_classname { Faker::Lorem.unique.word }
    profile_link { Faker::Internet.url }
    style { { color: "#fff" } }
  end
end