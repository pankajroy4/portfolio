class CreateProjectSoftwareSkills < ActiveRecord::Migration[7.1]
  def change
    create_table :project_software_skills, id: :uuid do |t|
      t.references :project, foreign_key: true, type: :uuid
      t.references :software_skill, foreign_key: true,type: :uuid
      t.integer :position

      t.timestamps
    end
  end
end
