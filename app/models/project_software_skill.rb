class ProjectSoftwareSkill < ApplicationRecord
  belongs_to :project
  belongs_to :software_skill

  acts_as_list scope: :project
end
