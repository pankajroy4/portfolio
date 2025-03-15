class Types::SoftwareSkillType < Types::BaseObject
  field :id, ID, null: false
  field :skill_name, String, null: false
  field :font_aws_icon_class, String, null: false
  field :style, GraphQL::Types::JSON, null: true
  field :position, Integer, null: true
  field :projects, [Types::ProjectType], null: true
  field :skill_id, ID, null: true
end
