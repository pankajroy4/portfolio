module Mutations
  class CreateDocument < BaseMutation
    field :success, Boolean, null: false
    field :document, Types::DocumentType, null: true
    field :errors, [String], null: false

    argument :document_type, Types::DocumentEnum, required: false
    argument :title, String, required: true
    argument :file, String, required: true
    #I have to add belong to feature

    def resolve(document_args)
      document_params = build_document_params(document_args)
      document = Document.create(document_params)
      if document.persisted?
        { success: true, document: document, errors: [] }
      else
        { success: false, document: nil, errors: document.errors.full_messages }
      end
    end

    private

    def build_document_params(params)
      params.to_h
      #add any other logic like permit etc
    end
  end
end
