FactoryBot.define do
  factory :site_configuration do
    status { "inactive" }

    trait :active do
      status { "active" }
    end
  end
end