class Types::CompetitiveSiteType < Types::BaseObject
  field :id, ID, null: false
  field :site_name, String, null: false
  field :iconify_classname, String, null: false
  field :style, GraphQL::Types::JSON, null: false
  field :profile_link, String, null: false
  field :position, Integer, null: true
  field :created_at, GraphQL::Types::ISO8601DateTime, null: false
  field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
end
