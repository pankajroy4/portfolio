class Queries::SocialMedia < Queries::BaseQuery
  description "Return a single Social Media link by ID"
  type Types::SocialMediaType, null: false
  argument :id, ID, required: true

  def resolve(id:)
    SocialMedia.find_by(id: id)
  end
end
