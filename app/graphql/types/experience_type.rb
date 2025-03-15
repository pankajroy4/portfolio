class Types::ExperienceType < Types::BaseObject
  field :id, ID, null: false
  field :title, String, null: false
  field :company_name, String, null: false
  field :company_url, String, null: true
  field :company_logo_image, String, null: true
  field :description, String, null: true
  field :location, String, null: true
  field :start_date, GraphQL::Types::ISO8601Date, null: false
  field :end_date, GraphQL::Types::ISO8601Date, null: true
  field :logo_color, String, null: true
  field :position, Integer, null: true
  field :experience_type, String, null: false
  field :duration, String, null: true

  def company_logo_image
    object.company_logo_image.url
  end

  def duration
    if object&.start_date && object&.end_date
      "#{object.start_date.strftime('%b %Y')} - #{object.end_date.strftime('%b %Y')}"
    elsif object&.start_date
      "#{object.start_date.strftime('%b %Y')} - Present"
    else
      " -"
    end
  end 
end
