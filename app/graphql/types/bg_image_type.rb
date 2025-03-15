class Types::BgImageType < Types::BaseObject
  field :id, ID, null: false
  field :bg_image_url, String, null: true
  field :project_id, ID, null: false

  def bg_image_url
    object&.bg_image&.url
    #  "#{Rails.application.config.asset_host}#{object.bg_image.url}"
  end
end
