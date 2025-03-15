class CreateDegrees < ActiveRecord::Migration[7.1]
  def change
    create_table :degrees, id: :uuid do |t|
      t.string :title
      t.string :subtitle
      t.string :alt_name
      t.date :start_date
      t.date :end_date
      t.jsonb :description, default: ["⚡ I have done B.Tech..", "👉 I have done ..."]
      t.string :website_link, default: "https://www.iitkh.edu/"
      t.integer :position
      t.string :logo_image

      t.timestamps
    end
  end
end
