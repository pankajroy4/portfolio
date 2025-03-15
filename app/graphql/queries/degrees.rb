class Queries::Degrees < Queries::BaseQuery
  type [Types::DegreeType], null: false

  def resolve
    Degree.all
  end
end
