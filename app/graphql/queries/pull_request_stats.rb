module Queries
  class PullRequestStats < Queries::BaseQuery
    type Types::PullRequestStatsType, null: false

    def resolve
      GithubStatsService.fetch_pr_counts
    end
  end
end
