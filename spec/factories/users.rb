FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { "Password123!" }
    password_confirmation { "Password123!" }
    role { "viewer" }
    confirmed_at { Time.current }

    trait :admin do
      role { "admin" }
    end
  end
end