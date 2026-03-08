FactoryBot.define do
  factory :skill do
    title { Faker::Job.unique.key_skill }
    filename { Faker::File.file_name }
  end
end