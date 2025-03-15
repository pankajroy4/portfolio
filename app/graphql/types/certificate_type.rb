class Types::CertificateType < Types::BaseObject
  field :id, ID, null: false
  field :title, String, null: false
  field :subtitle, String, null: false
  field :logo_url, String, null: true
  field :certificate_link, String, null: false
  field :alt_name, String, null: false
  field :color_code, String, null: false
  field :position, Integer, null: false

  def logo_url
    object&.logo_image&.url
  end
end
