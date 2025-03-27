# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :create_project, mutation: Mutations::CreateProject
    field :create_document, mutation: Mutations::CreateDocument
    field :create_social_media, mutation: Mutations::CreateSocialMedia
    field :update_social_media, mutation: Mutations::UpdateSocialMedia
    field :delete_social_media, mutation: Mutations::DeleteSocialMedia
    field :create_skill, mutation: Mutations::CreateSkill
    field :create_software_skill, mutation: Mutations::CreateSoftwareSkill
    field :create_competitive_site, mutation: Mutations::CreateCompetitiveSite
    field :update_competitive_site, mutation: Mutations::UpdateCompetitiveSite
    field :delete_competitive_site, mutation: Mutations::DeleteCompetitiveSite
  end
end
