class Queries::Documents < Queries::BaseQuery
  description "Return List of documents"
  argument :document_type, String, required: true

  type [Types::DocumentType], null: false

  def resolve(document_type:)
    case document_type
    when "resume"
      document = Document.resume.active.first
      document ? [document] : []
    when "docs"
      Document.docs.active
    else
      []
    end
  end
end