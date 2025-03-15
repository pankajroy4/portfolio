class Queries::Sections < Queries::BaseQuery
  # type [Types::SectionType], null: true
  type GraphQL::Types::JSON, null: true

  def resolve
    Section.all.index_by(&:section_name)
  end
end
