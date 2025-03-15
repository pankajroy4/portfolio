class CreateSoftwareSkills < ActiveRecord::Migration[7.1]
  def change
    create_table :software_skills, id: :uuid do |t|
      t.string :skill_name
      t.string :font_aws_icon_class, default: "simple-icons:javascript"
      t.jsonb :style, default: { "color": "#3776AB", "backgroundColor": "transparent"}
      t.integer :position
      t.references :skill, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
