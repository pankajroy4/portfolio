class Queries::CompetitiveSite < Queries::BaseQuery
  type Types::CompetitiveSiteType, null: false
  argument :id, ID, required: true

  def resolve(id:)
    CompetitiveSite.find(id)
  rescue ActiveRecord::RecordNotFound => e
    GraphQL::ExecutionError.new("Competitive site not found: #{e.message}")
  end
end
