# app/graphql/queries/document_queries.rb
class Queries::Projects < Queries::BaseQuery
  description "Return List of projetcs"
  type [Types::ProjectType], null: false

  def resolve
    Project.includes(:bg_images, :software_skills).all.order(:position)
  end
end
