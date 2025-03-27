class Mutations::CreateCompetitiveSite < Mutations::BaseMutation
  argument :site_name, String, required: true
  argument :iconify_classname, String, required: true
  argument :style, GraphQL::Types::JSON, required: false
  argument :profile_link, String, required: true

  field :competitive_site, Types::CompetitiveSiteType, null: true
  field :errors, [String], null: false

  def resolve(site_name:, iconify_classname:, style: {}, profile_link:)
    site = CompetitiveSite.new(
      site_name: site_name,
      iconify_classname: iconify_classname,
      style: style,
      profile_link: profile_link,
    )

    if site.save
      { competitive_site: site, errors: [] }
    else
      { competitive_site: nil, errors: site.errors.full_messages }
    end
  end
end
