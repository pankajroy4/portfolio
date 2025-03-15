class Api::V1::Admin::TokenValidationsController < DeviseTokenAuth::TokenValidationsController
  skip_before_action :assert_is_devise_resource!, only: [:validate_token]
  before_action :set_user_by_token, only: [:validate_token]

  def validate_token
    if @resource
      yield @resource if block_given?
      render json: { success: true, data: @resource }
    else
      render json: { success: false, message: "Invalid token" }, status: :unauthorized
    end
  end
end
