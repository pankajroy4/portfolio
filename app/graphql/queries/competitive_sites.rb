class Queries::CompetitiveSites < Queries::BaseQuery
  type [Types::CompetitiveSiteType], null: false

  def resolve
    CompetitiveSite.order(:position)
  end
end
