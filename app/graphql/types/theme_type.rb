class Types::ThemeType < Types::BaseObject
  field :body, String, null: true
  field :text, String, null: true
  field :exp_txt_color, String, null: true
  field :highlight, String, null: true
  field :dark, String, null: true
  field :secondary_text, String, null: true
  field :image_highlight, String, null: true
  field :comp_img_highlight, String, null: true
  field :jacket_color, String, null: true
  field :header_color, String, null: true
  field :splash_bg, String, null: true
end