module Mutations
  class CreateUser < BaseMutation
    field :success, Boolean, null: false
    field :user, Types::UserType, null: true
    field :errors, [String], null: false

    argument :role, Types::UserRoleEnum, required: false
    argument :name, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true
    argument :password_confirmation, String, required: true

    def resolve(user_args)
      user_params = build_user_params(user_args)
      user = User.create(user_params)
      if user.persisted?
        { success: true, user: user, errors: [] }
      else
        { success: false, user: nil, errors: user.errors.full_messages.uniq }
      end
    end

    private

    def build_user_params(params)
      params.to_h.merge(
        confirmed_at: Time.now,
        role: "admin",  #Will be commented later
      )
    end
  end
end
