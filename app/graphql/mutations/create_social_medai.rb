class Mutations::CreateSocialMedia < Mutations::BaseMutation
  description "Create a new Social Media entry"

  argument :name, String, required: true
  argument :link, String, required: true
  argument :font_aws_icon_class, String, required: true
  argument :bg_color, String, required: false

  field :social_media, Types::SocialMediaType, null: false

  def resolve(name:, link:, font_aws_icon_class:, bg_color: "#000000")
    social_media = SocialMedia.create!(
      name: name,
      link: link,
      font_aws_icon_class: font_aws_icon_class,
      bg_color: bg_color,
    )
    { social_media: social_media }
  end
end
