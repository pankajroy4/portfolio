class Queries::SiteConfiguration < Queries::BaseQuery
  argument :id, ID, required: true
  type Types::SiteConfigurationType, null: false

  def resolve(id:)
    SiteConfiguration.find_by(id: id) || raise(GraphQL::ExecutionError, "SiteConfiguration not found")
  end
end
