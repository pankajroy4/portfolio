class Types::ProjectType < Types::BaseObject
  field :id, ID, null: false
  field :name, String, null: false
  field :start_date, String, null: true
  field :end_date, String, null: true
  field :description, String, null: true
  field :github_url, String, null: true
  field :bg_images, [Types::BgImageType], null: true
  field :software_skills, [Types::SoftwareSkillType], null: true
  field :other, GraphQL::Types::JSON, null: true
  field :duration, String, null: true

  def start_date
    object.start_date.strftime("%d/%m/%Y") if object.start_date
  end

  def end_date
    object.end_date.strftime("%d/%m/%Y") if object.end_date
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
