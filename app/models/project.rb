class Project < ApplicationRecord
  has_many :documents, dependent: :destroy
  has_many :bg_images, dependent: :destroy
  has_many :project_software_skills, dependent: :destroy
  has_many :software_skills, through: :project_software_skills

  validates :name, :description, presence: true
  acts_as_list
end
