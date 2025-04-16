module Types
  class SocialMediaType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :link, String, null: false
    field :font_aws_icon_class, String, null: false
    field :bg_hash_code, String, null: true
  end
end
