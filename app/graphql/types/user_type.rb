# app/graphql/types/user_type.rb
module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :role, Types::UserRoleEnum, null: false
    field :profile_image_url, String, null: true
  end

  def profile_image_url
    return nil if object.profile_image.blank?

    url_for(object.profile_image)
  end
end

# query {
#   user(id: "202aa617-8634-4620-beb3-9905a32d7f05") {
#     id
#     name
#     email
#   }
# }

# query {
#   users {
#     id
#     name
#     email
#   }
# }
