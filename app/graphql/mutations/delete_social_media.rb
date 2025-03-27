module Mutations
  class DeleteSocialMedia < BaseMutation
    description "Delete a Social Media entry"

    argument :id, ID, required: true

    field :success, Boolean, null: false

    def resolve(id:)
      social_media = SocialMedia.find(id)
      social_media.destroy!
      { success: true }
    end
  end
end
