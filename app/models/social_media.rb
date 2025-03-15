class SocialMedia < ApplicationRecord
  default_scope { order(position: :asc) }
  acts_as_list
end
