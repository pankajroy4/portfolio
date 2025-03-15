class Experience < ApplicationRecord
  mount_uploader :company_logo_image, SectionImageUploader
  enum experience_type: { work: "work", internship: "internship", freelance: "freelance", volunteership: "volunteership" }
end

