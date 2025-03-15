module Queries
  class PullRequests < Queries::BaseQuery
    type Types::PullRequestCustomType, null: false

    argument :after, String, required: false
    argument :first, Integer, required: true

    def resolve(after: nil, first:)
      data = GithubService.fetch_pull_requests(after, first)

      {
        "pull_requests" => data["nodes"],
        "page_info" => {
          "has_next_page" => data.dig("pageInfo", "hasNextPage"),
          "end_cursor" => data.dig("pageInfo", "endCursor"),
        },
      }
    end
  end
end
