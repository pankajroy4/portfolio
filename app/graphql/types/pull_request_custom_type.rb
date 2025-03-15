module Types
  class PullRequestCustomType < Types::BaseObject
    field :pull_requests, [Types::PullRequestType], null: true
    field :page_info, Types::PageInfoType, null: true
  end
end
