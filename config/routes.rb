require "sidekiq/web"

Rails.application.routes.draw do
  root "homes#index"
  post "/graphql", to: "graphql#execute"

  namespace :admin do
    devise_for :users, controllers: {
                         sessions: "admin/users/sessions",
                         registrations: "admin/users/registrations",
                         confirmations: "admin/users/confirmations",
                         passwords: "admin/users/passwords",
                       }
  end

  #For admin panel with react front-end
  namespace :api do
    namespace :v1 do
      namespace :admin do
        mount_devise_token_auth_for "User", at: "auth", controllers: {
                                              # registrations: "api/v1/admin/registrations",
                                              # confirmations: "api/v1/admin/confirmations",
                                              # passwords: "api/v1/admin/passwords",
                                              # sessions: "api/v1/admin/sessions",
                                              token_validations: "api/v1/admin/token_validations",
                                            }

        devise_scope :admin_user do
          #For token validation to show "Admin Dashboard" nav link in frontend
          get "auth/validate_cookies_token", to: "token_validations#validate_token"
        end
      end
    end
  end

  devise_scope :admin_user do
    get "login", to: "admin/users/sessions#new", as: :admin_login
    get "signup", to: "admin/users/registrations#new", as: :admin_signup
    get "update", to: "admin/users/registrations#edit", as: :admin_update
  end

  authenticate :admin_user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => "/sidekiq"
    mount RailsAdmin::Engine => "/superadmin", as: "rails_admin"
    if Rails.env.development?
      mount GraphqlPlayground::Rails::Engine, at: "/playground", graphql_path: "/graphql"
    end
  end

  get "*path", to: "homes#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
