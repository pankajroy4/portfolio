class CreateCertificates < ActiveRecord::Migration[7.1]
  def change
    create_table :certificates, id: :uuid do |t|
      t.string :title
      t.string :subtitle
      t.string :logo_image
      t.string :certificate_link, default: "https://www.coursera.org/"
      t.string :alt_name
      t.string :color_code, default: "#0C9D5899"
      t.integer :position

      t.timestamps
    end
  end
end
