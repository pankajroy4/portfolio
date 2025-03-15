class Api::V1::Admin::Mailer < Devise::Mailer
  def confirmation_instructions(record, token, opts = {})
    @resource = record
    @token = token
    mail to: @resource.email, subject: "Confirmation instructions"
  end

  def reset_password_instructions(record, token, opts = {})
    @token = token
    @resource = record
    mail to: @resource.email, subject: "Reset Password instructions"
  end

  def email_changed(record, opts = {})
    @resource = record
    mail to: @resource.email, subject: "Email changed notification"
  end

  def password_change(record, opts = {})
     @resource = record
    mail to: @resource.email, subject: "Password changed notification"
  end
end
