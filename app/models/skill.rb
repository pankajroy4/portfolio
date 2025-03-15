class Skill < ApplicationRecord
  mount_uploader :skill_image, SkillImageUploader

  has_many :software_skills

  validates :title, :filename, presence: true
  acts_as_list
end