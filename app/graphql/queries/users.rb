class Queries::Users < Queries::BaseQuery
  description "Return List of users"
  type [Types::UserType], null: false

  def resolve
    User.all
  end
end
