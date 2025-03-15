class Types::RepositoryType < Types::BaseObject
  field :name, String, null: false
  field :url, String, null: false
  field :owner, Types::OwnerType, null: false
end
