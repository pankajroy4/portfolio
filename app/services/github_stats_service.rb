require "rest-client"
require "json"

class GithubStatsService
  GITHUB_API_URL = "https://api.github.com"
  USERNAME = Rails.application.credentials.dig(:github, :username)
  ACCESS_TOKEN = Rails.application.credentials.dig(:github, :access_token)

  def self.fetch_pr_counts
    {
      open: fetch_pr_count("open"),
      closed: fetch_pr_count("closed"),
      merged: fetch_merged_pr_count,
    }
  end

  private

  def self.fetch_pr_count(state)
    total_count = 0
    page = 1

    loop do
      response = RestClient.get(
        "#{GITHUB_API_URL}/search/issues?q=type:pr+state:#{state}+author:#{USERNAME}&per_page=100&page=#{page}",
        { Authorization: "Bearer #{ACCESS_TOKEN}" }
      )

      prs = JSON.parse(response.body)
      total_count += prs["items"].count
      break if prs["items"].empty?

      page += 1
    end

    total_count
  end

  def self.fetch_merged_pr_count
    total_count = 0
    page = 1

    loop do
      response = RestClient.get(
        "#{GITHUB_API_URL}/search/issues?q=type:pr+state:closed+author:#{USERNAME}&per_page=100&page=#{page}",
        { Authorization: "Bearer #{ACCESS_TOKEN}" }
      )

      prs = JSON.parse(response.body)
      total_count += prs["items"].count { |pr| pr["pull_request"] && pr["pull_request"]["merged_at"].present? }
      break if prs["items"].empty?

      page += 1
    end

    total_count
  end
end
