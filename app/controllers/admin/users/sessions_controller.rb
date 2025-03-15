class Admin::Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  def create
    super do |resource|
      if resource
        token = resource.create_new_auth_token
        set_auth_cookies(token)
      end
    end
  end

  def destroy
    user = current_admin_user
    super do |_|
      if (client_id = (cookies.encrypted[:auth_headers] || "{}")["client"]) && user&.tokens[client_id]
        user.tokens.delete(client_id)
        user.save!
      end
      cookies.delete(:auth_headers)
    end
  end

  protected

  def set_auth_cookies(token)
    cookies.encrypted[:auth_headers] = {
      value: token,
      httponly: true,
      secure: Rails.env.production?,
      same_site: :lax,
    }
  end

  def after_sign_in_path_for(resource)
    if resource.admin?
      rails_admin_path
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
