class CreateThemes < ActiveRecord::Migration[7.1]
  def change
    create_table :themes, id: :uuid do |t|
      t.string :name, default: "blueTheme"
      t.string :body, default: "#EDF9FE" 
      t.string :text, default: "#001C55"
      t.string :exp_txt_color, default: "#000a12"
      t.string :highlight, default: "#A6E1FA"
      t.string :dark, default: "#00072D"
      t.string :secondary_text, default: "#7F8DAA"
      t.string :image_highlight, default: "#0E6BA8"
      t.string :comp_img_highlight, default: "#E6E6E6"
      t.string :jacket_color, default: "#0A2472"
      t.string :header_color, default: "#0E6BA877"
      t.string :splash_bg, default: "#001C55"

      t.timestamps
    end
  end
end