module Mutations
  class CreateProject < BaseMutation
    field :success, Boolean, null: false
    field :project, Types::ProjectType, null: true
    field :errors, [String], null: false

    argument :name, String, required: true
    argument :start_date, Types::DateType, required: true
    argument :end_date, Types::DateType, required: true
    argument :description, String, required: true
    argument :other, String, required: true

    def resolve(project_args)
      project_params = build_project_params(project_args)
      project = Project.create(project_params)
      if project.persisted?
        { success: true, project: project, errors: [] }
      else
        { success: false, project: nil, errors: project.errors.full_messages }
      end
    end

    private

    def build_project_params(params)
      params.to_h
      #add any other logic like permit etc
    end
  end
end
