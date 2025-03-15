RailsAdmin.config do |config|
  config.asset_source = :sprockets
  config.authenticate_with do
    warden.authenticate! scope: :admin_user
  end
  config.current_user_method(&:current_admin_user)

  config.parent_controller = "::ApplicationController"
  config.authorize_with :pundit

  # config.model 'SiteConfiguration' do
  #   edit do
  #     field :settings, :json
  #     field :seo, :json
  #     field :image, :carrierwave

  #     field :greeting_image_file, :string do
  #       label "Greeting Section Image"
  #       help "Upload an image for the Greeting section"
  #       html_attributes do
  #         { type: "file" }
  #       end
  #     end

  #     field :projects_header_image_file, :string do
  #       label "Projects Header Image"
  #       help "Upload an image for the Projects section"
  #       html_attributes do
  #         { type: "file" }
  #       end
  #     end

  #     field :publications_header_image_file, :string do
  #       label "Publications Header Image"
  #       help "Upload an image for the Publications section"
  #       html_attributes do
  #         { type: "file" }
  #       end
  #     end

  #     field :experience_header_image_file, :string do
  #       label "Experience Header Image"
  #       help "Upload an image for the Experience section"
  #       html_attributes do
  #         { type: "file" }
  #       end
  #     end
  #   end
  # end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
