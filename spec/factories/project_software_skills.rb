FactoryBot.define do
  factory :project_software_skill do
    association :project
    association :software_skill
  end
end