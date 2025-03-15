class Queries::SocialMedias < Queries::BaseQuery
  description "Return List of Social Media Links"
  type [Types::SocialMediaType], null: false

  def resolve
    SocialMedia.all
  end
end
