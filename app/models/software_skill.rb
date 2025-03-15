class SoftwareSkill < ApplicationRecord
  belongs_to :skill, optional: true
  has_many :project_software_skills, dependent: :destroy
  has_many :projects, through: :project_software_skills
  acts_as_list

  validates :skill_name, :font_aws_icon_class, presence: true
  default_scope { order(:position) }
end
