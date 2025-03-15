class Mutations::UpdateCompetitiveSite < Mutations::BaseMutation
  argument :id, ID, required: true
  argument :site_name, String, required: false
  argument :iconify_classname, String, required: false
  argument :style, GraphQL::Types::JSON, required: false
  argument :profile_link, String, required: false

  field :competitive_site, Types::CompetitiveSiteType, null: true
  field :errors, [String], null: false

  def resolve(id:, **attributes)
    site = CompetitiveSite.find_by(id: id)

    if site.nil?
      return { competitive_site: nil, errors: ["Competitive site not found"] }
    end

    if site.update(attributes)
      { competitive_site: site, errors: [] }
    else
      { competitive_site: nil, errors: site.errors.full_messages }
    end
  end
end
