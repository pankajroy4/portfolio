class Queries::SiteConfigurations < Queries::BaseQuery
  type [Types::SiteConfigurationType], null: true
  argument :status, Types::StatusEnum, required: false

  # There will be only one active configuration at a time
  def resolve(status: nil)
    [SiteConfiguration.where(status: 'active').last].compact
  end
end