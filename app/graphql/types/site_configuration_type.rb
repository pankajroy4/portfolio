class Types::SiteConfigurationType < Types::BaseObject
  field :id, ID, null: true
  field :status, Types::StatusEnum, null: true
  field :splash, Boolean, null: true
  field :seo, GraphQL::Types::JSON, null: true
  field :menu_items, GraphQL::Types::JSON, null: true
  field :theme, Types::ThemeType, null: true
  field :logo_name, String, null: true
  field :credentials, GraphQL::Types::JSON, null: true
  field :same_as, GraphQL::Types::JSON, null: true
  field :address, GraphQL::Types::JSON, null: true

  def credentials
    Certificate.pluck(:certificate_link, :title, :subtitle).map do |link, title, subtitle|
      { "@context": "https://schema.org", "@type": "EducationalOccupationalCredential", url: link, name: title, description: subtitle }
    end    
  end

  def job_title
    Experience.work&.first&.title
  end

  def same_as
    links = SocialMedia.pluck(:link)
    index = links.find_index { |link| link.start_with?("mailto:") }
    links[index] = links[index][7..] if index
    links.compact
  end
end
