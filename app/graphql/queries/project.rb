class Queries::Project < Queries::BaseQuery
  description "Return Project by id"
  type Types::ProjectType, null: false
  argument :id, ID, required: true

  def resolve(id:)
    project = Project.find_by(id: id)
    raise ActiveRecord::RecordNotFound, "Couldn't find Document with id='#{id}'" if project.blank?
    project
  end
end
