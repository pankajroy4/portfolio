class ApplicationController < ActionController::Base
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from JSON::ParserError, with: :handle_invalid_json
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  protect_from_forgery unless: -> { request.format.json? }
  # before_action :set_csrf_cookie
  before_action :set_auth_headers_from_cookies, if: :validate_token_action? #if used cookies_based authentication

  private

  def pundit_user
    current_admin_user
  end

  def rails_admin_controller?
    self.class.name.split("::").first == "RailsAdmin"
  end

  def set_auth_headers_from_cookies
    auth_headers = cookies.encrypted[:auth_headers] || {}

    if auth_headers.present?
      request.headers.merge!({
        "access-token" => auth_headers["access-token"],
        "client" => auth_headers["client"],
        "uid" => auth_headers["uid"],
      })
    end
  end

  def validate_token_action?
    controller_name == "token_validations" && action_name == "validate_token"
  end

  def set_csrf_cookie
    cookies["CSRF-TOKEN"] = form_authenticity_token
  end

  def handle_invalid_json(exception)
     flash[:error] = "Invalid JSON format: #{exception.message}"
    redirect_back(fallback_location: request.referer || "/superadmin")
  end
end
