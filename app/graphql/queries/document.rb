class Queries::Document < Queries::BaseQuery
  description "Return Document by id"
  type Types::DocumentType, null: false
  argument :id, ID, required: true

  def resolve(id:)
    document = Document.find_by(id: id)
    raise ActiveRecord::RecordNotFound, "Couldn't find Document with id='#{id}'" if document.blank?
    document
  end
end
