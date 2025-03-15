# frozen_string_literal: true

class Admin::Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :configure_permitted_parameters, only: [:update]

  def create
    redirect_to "/home", alert: "Signup Not Allowed!"
  end

  def update
    super
  end

  def destroy
    redirect_to "/home", alert: "Account Deactivation Not Allowed!"
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  def after_sign_up_path_for(resource)
    if resource.admin?
      rails_admin_path
    else
      root_path
    end
  end

  def after_sign_in_path_for(resource)
    if resource.admin?
      rails_admin_path
    else
      root_path
    end
  end

  def after_inactive_sign_up_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])

    # unless params[:admin_user][:role]
    #   params[:admin_user][:role] = "admin"
    # end
  end
end
