# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :user, resolver: Queries::User
    field :users, resolver: Queries::Users
    field :project, resolver: Queries::Project
    field :projects, resolver: Queries::Projects
    field :document, resolver: Queries::Document
    field :documents, resolver: Queries::Documents
    field :social_medias, resolver: Queries::SocialMedias
    field :social_media, resolver: Queries::SocialMedia
    field :skills, resolver: Queries::Skills
    field :skill, resolver: Queries::Skill
    field :competitive_sites, resolver: Queries::CompetitiveSites
    field :competitive_site, resolver: Queries::CompetitiveSite
    field :site_configurations, resolver: Queries::SiteConfigurations
    field :site_configuration, resolver: Queries::SiteConfiguration
    field :sections, resolver: Queries::Sections
    field :section, resolver: Queries::Section
    field :experiences, resolver: Queries::Experiences
    field :degrees, resolver: Queries::Degrees
    field :certificates, resolver: Queries::Certificates
    field :pull_requests, resolver: Queries::PullRequests
    field :pull_request_stats, resolver: Queries::PullRequestStats

    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ID], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end
  end
end
