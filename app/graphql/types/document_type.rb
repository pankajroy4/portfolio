class Types::DocumentType < Types::BaseObject
  field :id, ID, null: false
  field :title, String, null: false
  field :url, String, null: true
  field :document_type, Types::DocumentEnum, null: true
  field :status, Types::StatusEnum, null: false
  # field :project, Types::ProjectType, null: false
  field :project_id, ID, null: true

  def url
    return nil if object.file.blank?
    # object.file.url if object.file.present?
    "#{Rails.application.config.asset_host}#{object.file.url}" #To include domain in url
  end
end
