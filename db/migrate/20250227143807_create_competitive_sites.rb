class CreateCompetitiveSites < ActiveRecord::Migration[7.1]
  def change
    create_table :competitive_sites, id: :uuid do |t|
      t.string :site_name
      t.string :iconify_classname, default: "simple-icons:hackerearth"
      t.jsonb :style, default: {"color": "#323754"}
      t.string :profile_link, default: "https://www.hackerearth.com/@pankaj2290/"
      t.integer :position

      t.timestamps
    end
  end
end
