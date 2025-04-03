RailsAdmin.config do |config|
  config.asset_source = :sprockets
  config.authenticate_with do
    warden.authenticate! scope: :admin_user
  end
  config.current_user_method(&:current_admin_user)

  config.parent_controller = "::ApplicationController"
  config.authorize_with :pundit

  config.model "ProjectSoftwareSkill" do
    visible false
  end

  config.model "SoftwareSkill" do
    object_label_method :skill_name
  end

  #Order of field declaration block matter, if we put this block in last then it will not work and show all fields.

  config.model "SoftwareSkill" do
    edit do
      field :skill_name
      field :font_aws_icon_class
      field :style
      field :position
      field :skill
      field :projects
    end
  end

  config.model "Project" do
    edit do
      field :name
      field :start_date
      field :end_date
      field :description
      field :github_url
      field :other
      field :position
      field :software_skills
    end
  end

  config.model "User" do
    edit do
      field :email
      field :name
      field :password
      field :role
      field :profile_image
      field :confirmed_at
      field :uid
    end
  end

  ["BgImage", "Certificate", "CompetitiveSite", "Degree", "Document", "Experience", "Project", "Section", "SiteConfiguration", "Skill", "SocialMedia", "SoftwareSkill", "Theme", "User"].each do |imodel|
    config.model imodel do
      list do
        exclude_fields :created_at, :updated_at, :id
      end
      update do
        exclude_fields :created_at, :updated_at, :id
      end
    end
  end

  config.model "Section" do
    list do
      exclude_fields :section_image, :others, :button, :description
    end
  end

  config.model "Skill" do
    list do
      exclude_fields :software_skills, :skill_image, :skill_highlight
    end
  end

  config.model "Certificate" do
    list do
      exclude_fields :logo_image, :alt_name
    end
  end

  config.model "Degree" do
    list do
      exclude_fields :logo_image, :description
    end
  end

  config.model "Experience" do
    list do
      exclude_fields :company_logo_image, :description, :logo_color
    end
  end

  config.model "SiteConfiguration" do
    list do
      exclude_fields :seo, :menu_items, :address
    end
  end

  config.model "SoftwareSkill" do
    exclude_fields :project_software_skills

    list do
      exclude_fields :project_software_skills, :style
    end
  end

  config.model "Project" do
    exclude_fields :bg_images, :project_software_skills, :documents # Global exclusion

    list do
      exclude_fields :bg_images, :project_software_skills, :documents, :description, :other, :software_skills
    end
  end

  config.model "User" do
    exclude_fields :password, :password_confirmation, :reset_password_sent_at, :remember_created_at, :confirmation_token, :confirmation_sent_at, :unconfirmed_email, :tokens, :provider

    list do
      exclude_fields :password, :password_confirmation, :reset_password_sent_at, :remember_created_at, :confirmation_token, :confirmation_sent_at, :unconfirmed_email, :tokens, :provider
    end

    edit do
      exclude_fields :password_confirmation, :reset_password_sent_at, :remember_created_at, :confirmation_token, :confirmation_sent_at, :unconfirmed_email, :tokens, :provider
    end
  end

  config.actions do
    dashboard
    index
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
