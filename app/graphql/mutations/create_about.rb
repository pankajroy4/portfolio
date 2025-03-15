module Mutations
  class CreateAbout < BaseMutation
    field :success, Boolean, null: false
    field :about, Types::AboutType, null: true
    field :errors, [String], null: false

    argument :status, Types::StatusEnum, required: true
    argument :designations, [String], required: true
    argument :name, String, required: true
    argument :description, String, required: true

    def resolve(about_args)
      about_params = build_about_params(about_args)
      about = About.create(about_params)

      if about.persisted?
        { success: true, about: about, errors: [] }
      else
        { success: false, about: nil, errors: about.errors.full_messages }
      end
    end

    private

    def build_about_params(params)
      # Permit the necessary parameters (add association handling if needed)
      params = params.to_h
      params[:designations] = params[:designations] || []
      params
    end
  end
end
