class Types::SectionType < Types::BaseObject
  field :id, ID, null: true
  field :section_name, String, null: true
  field :title, String, null: true
  field :subtitle, String, null: true
  field :section_image_url, String, null: true
  field :section_svg_data, String, null: true
  field :description, String, null: true
  field :button, GraphQL::Types::JSON, null: true
  field :others, GraphQL::Types::JSON, null: true

  def section_image_url
    object&.section_image&.url
  end
end
