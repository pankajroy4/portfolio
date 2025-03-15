module Types
  class PullRequestStatsType < Types::BaseObject
    field :open, Integer, null: false
    field :closed, Integer, null: false
    field :merged, Integer, null: false
  end
end
