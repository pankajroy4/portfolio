class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects, id: :uuid do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.text :description
      t.string :github_url
      t.jsonb :other, default: {}
      t.integer :position

      t.timestamps
    end
  end
end
