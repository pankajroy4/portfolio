class CreateSocialMedia < ActiveRecord::Migration[7.1]
  def change
    create_table :social_media, id: :uuid do |t|
      t.string :name
      t.string :link, default: "https://www.instagram.com/pankajroy.4/"
      t.string :font_aws_icon_class, default: "fa-instagram"
      t.string :bg_hash_code, default: "#E4405F"
      t.integer :position

      t.timestamps
    end
  end
end