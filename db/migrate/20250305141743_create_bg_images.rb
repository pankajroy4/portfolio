class CreateBgImages < ActiveRecord::Migration[7.1]
  def change
    create_table :bg_images, id: :uuid do |t|
      t.string :bg_image
      t.references :project, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
