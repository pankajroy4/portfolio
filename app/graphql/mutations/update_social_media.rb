class Mutations::UpdateSocialMedia < Mutations::BaseMutation
  description "Update an existing Social Media entry"

  argument :id, ID, required: true
  argument :name, String, required: false
  argument :link, String, required: false
  argument :font_aws_icon_class, String, required: false
  argument :bg_color, String, required: false

  field :social_media, Types::SocialMediaType, null: false

  def resolve(id:, name: nil, link: nil, font_aws_icon_class: nil, bg_color: nil)
    social_media = SocialMedia.find(id)
    social_media.update!(
      name: name,
      link: link,
      font_aws_icon_class: font_aws_icon_class,
      bg_color: bg_color,
    )
    { social_media: social_media }
  end
end
