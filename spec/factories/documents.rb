FactoryBot.define do
  factory :document do
    title { Faker::File.file_name }
    document_type { "docs" }
    status { "inactive" }
    association :project
    file { Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/files/test.pdf"), "application/pdf") }

    trait :resume do
      document_type { "resume" }
      status { "active" }
    end
  end
end