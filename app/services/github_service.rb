require "rest-client"

class GithubService
  GITHUB_API_URL = "https://api.github.com/graphql".freeze
  USERNAME = Rails.application.credentials.dig(:github, :username)
  ACCESS_TOKEN = Rails.application.credentials.dig(:github, :access_token)

  def self.fetch_pull_requests(after_cursor = nil, first = 500)
    query = <<~GRAPHQL
      query($after: String, $first: Int!) {
        user(login: "#{USERNAME}") {
          pullRequests(first: $first, after: $after, orderBy: {field: CREATED_AT, direction: DESC}) {
          totalCount
            nodes {
              id
              title
              url
              state
              mergedBy { login }
              createdAt
              number
              changedFiles
              additions
              deletions
              baseRepository {
                name
                url
                owner {
                  avatarUrl
                  login
                  url
                }
              }
            }
            pageInfo {
               endCursor
               hasNextPage
            }
          }
        }
      }
    GRAPHQL

    payload = {
      query: query,
      variables: {
        username: USERNAME,
        after: after_cursor,
        first: first,
      },
    }

    headers = {
      Authorization: "Bearer #{ACCESS_TOKEN}",
      content_type: :json,
      accept: :json,
    }

    response = RestClient.post(GITHUB_API_URL, payload.to_json, headers)
    JSON.parse(response.body).dig("data", "user", "pullRequests")
  rescue RestClient::ExceptionWithResponse => e
    Rails.logger.error "GitHub API Error: #{e.response}"
    []
  end
end



