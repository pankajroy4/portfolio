class CreateDocuments < ActiveRecord::Migration[7.1]
  def change
    create_table :documents, id: :uuid do |t|
      t.string :title
      t.string :file
      t.string :document_type
      t.string :status, default: "inactive"
      t.references :project, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
