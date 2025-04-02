require "active_support/core_ext/integer/time"

Rails.application.configure do
  config.enable_reloading = false
  config.eager_load = true
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true
  # config.asset_host = "http://assets.example.com"
  config.active_storage.service = :local
  config.force_ssl = true

  # Log to STDOUT by default
  config.logger = ActiveSupport::Logger.new(STDOUT)
    .tap { |logger| logger.formatter = ::Logger::Formatter.new }
    .then { |logger| ActiveSupport::TaggedLogging.new(logger) }

  config.log_tags = [:request_id]
  # want to log everything, set the level to "debug".
  config.log_level = ENV.fetch("RAILS_LOG_LEVEL", "info")

  # Use a different cache store in production.
  # config.cache_store = :mem_cache_store
  # config.active_job.queue_name_prefix = "portfolio_production"

  config.action_mailer.perform_caching = false
  config.i18n.fallbacks = true
  config.active_support.report_deprecations = false
  config.active_record.dump_schema_after_migration = false

  # config.assets.compile = false, #Not needed beacuse we are using esbuild
  # config.public_file_server.enabled = false, #Not needed beacuse we are using esbuild

  #config.active_job.queue_adapter = :sidekiq
  config.active_job.queue_adapter = :inline
  Rails.application.routes.default_url_options[:host] = "https://pankajroy.in"

  config.action_mailer.default_url_options = { host: "https://pankajroy.in" }
  config.action_mailer.perform_deliveries = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: "smtp.gmail.com",
    port: 587,
    domain: "pankajroy.in",
    user_name: Rails.application.credentials.smtp_username,
    password: Rails.application.credentials.smtp_password,
    authentication: "plain",
    enable_starttls_auto: true,
    open_timeout: 5,
    read_timeout: 5,
  }
end