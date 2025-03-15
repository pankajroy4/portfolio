class Mutations::DeleteCompetitiveSite < Mutations::BaseMutation
  argument :id, ID, required: true

  field :success, Boolean, null: false
  field :errors, [String], null: false

  def resolve(id:)
    site = CompetitiveSite.find_by(id: id)

    if site.nil?
      return { success: false, errors: ["Competitive site not found"] }
    end

    if site.destroy
      { success: true, errors: [] }
    else
      { success: false, errors: site.errors.full_messages }
    end
  end
end
