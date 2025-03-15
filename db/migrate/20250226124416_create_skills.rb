class CreateSkills < ActiveRecord::Migration[7.1]
  def change
    create_table :skills, id: :uuid do  |t|
      t.string :title
      t.string :filename
      t.text :skill_svg_data
      t.jsonb :skill_highlight, default: [ "⚡ Designing highly attractive user interface for mobile and web applications", "⚡ Customizing logo designs and building logos from scratch", "⚡ Creating the flow of application functionalities to optimize user experience" ]
      t.string :skill_image
      t.integer :position

      t.timestamps
    end
  end
end
