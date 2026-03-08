FactoryBot.define do
  factory :software_skill do
    skill_name { Faker::ProgrammingLanguage.name }
    font_aws_icon_class { "fa-#{Faker::Lorem.word}" }
    association :skill
  end
end