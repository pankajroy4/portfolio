class Queries::Section < Queries::BaseQuery
  argument :section_name, String, required: true
  type Types::SectionType, null: true

  def resolve(section_name:)
    Section.where(section_name: section_name)&.first
  end
end
