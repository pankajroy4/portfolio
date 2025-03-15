class Types::DegreeType < Types::BaseObject
  field :id, ID, null: false
  field :title, String, null: false
  field :subtitle, String, null: false
  field :alt_name, String, null: true
  field :start_date, GraphQL::Types::ISO8601Date, null: false
  field :end_date, GraphQL::Types::ISO8601Date, null: false
  field :description, [String], null: false
  field :website_link, String, null: true
  field :position, Integer, null: false
  field :logo_url, String, null: true
  field :duration, String, null: false

  def duration
    "#{object.start_date.strftime("%b %Y")} - #{object.end_date.strftime("%b %Y")}"
  end

  def logo_url
    object&.logo_image&.url
  end
end
