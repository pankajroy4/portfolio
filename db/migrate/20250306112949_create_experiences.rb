class CreateExperiences < ActiveRecord::Migration[7.1]
  def change
    create_table :experiences, id: :uuid do |t|
      t.string :title
      t.string :company_name
      t.string :company_url
      t.string :company_logo_image
      t.text :description
      t.string :location
      t.date :start_date
      t.date :end_date
      t.string :logo_color, default: "#000000"
      t.integer :position
      t.string :experience_type

      t.timestamps
    end
  end
end
