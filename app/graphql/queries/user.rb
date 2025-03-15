class Queries::User < Queries::BaseQuery
  description "Return User"
  type Types::UserType, null: false
  argument :id, ID, required: true

  def resolve(id:)
    User.where(id: id).first
  end
end
