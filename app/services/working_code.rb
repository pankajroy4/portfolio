github_services:
=========================

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

    JSON.parse(response.body).dig("data", "user", "pullRequests", "nodes") || []
  rescue RestClient::ExceptionWithResponse => e
    Rails.logger.error "GitHub API Error: #{e.response}"
    []
  end
end












pull_requests.rb
====================
class Queries::PullRequests < Queries::BaseQuery
  argument :after, String, required: true
  argument :first, Integer, required: true 
  type Types::PullRequestType.connection_type, null: false

  def resolve(after: nil, first: 100)
    pull_requests = GithubService.fetch_pull_requests(after, first)
    pull_requests.map { |pr| OpenStruct.new(pr) } 
  end
end










pull_requests_types.rb
===========================
class Types::PullRequestType < Types::BaseObject
  field :id, ID, null: false
  field :title, String, null: false
  field :url, String, null: false
  field :state, String, null: false
  field :mergedBy, Types::MergedByType, null: true
  field :createdAt, String, null: true
  field :number, Integer, null: false
  field :changedFiles, Integer, null: true
  field :additions, Integer, null: false
  field :deletions, Integer, null: false
  field :baseRepository, Types::RepositoryType, null: true
end




RepositoryType.rb
======================
class Types::RepositoryType < Types::BaseObject
  field :name, String, null: false
  field :url, String, null: false
  field :owner, Types::OwnerType, null: false
end



OwnerType.tb
===================
class Types::OwnerType < Types::BaseObject
  field :avatarUrl, String, null: false
  field :login, String, null: false
  field :url, String, null: false
end







MergedByType.rb:
=====================
class Types::MergedByType < Types::BaseObject
  field :login, String, null: false
end





pullRequests.js
===================

import React, { useEffect, useState } from "react";
import "./PullRequests.css";
import { Fade } from "react-reveal";
import PullRequestCard from "../../components/pullRequestCard/PullRequestCard";

import { useQuery, NetworkStatus } from "@apollo/client";
import { GET_PULL_REQUESTS } from "../../api/queries/pullRequestsQuery";
import { LoadingSkeleton } from "../../components/skeleton/LoadingSkeleton";

const PullRequests = ({ theme }) => {
  const { loading, error, data, fetchMore, networkStatus } = useQuery(GET_PULL_REQUESTS, {
    variables: { after: null, first: 10 },
    notifyOnNetworkStatusChange: true,
  });

  const [isFetching, setIsFetching] = useState(false);

  const pullRequests = data?.pullRequests?.edges || [];
  const { endCursor, hasNextPage } = data?.pullRequests?.pageInfo || {};

  console.log(endCursor, hasNextPage)
  useEffect(() => {
    const handleScroll = () => {
      if (
        window.innerHeight + document.documentElement.scrollTop >=
        document.documentElement.offsetHeight - 100
      ) {
        if (hasNextPage && !isFetching) {
          setIsFetching(true);
          fetchMore({
            variables: { after: endCursor, first: 10 },
            updateQuery: (prevResult, { fetchMoreResult }) => {
              if (!fetchMoreResult) return prevResult;

              return {
                pullRequests: {
                  ...fetchMoreResult.pullRequests,
                  edges: [
                    ...prevResult.pullRequests.edges,
                    ...fetchMoreResult.pullRequests.edges,
                  ],
                },
              };
            },
          }).finally(() => setIsFetching(false));
        }
      }
    };

    window.addEventListener('scroll', handleScroll);
    return () => window.removeEventListener('scroll', handleScroll);
  }, [endCursor, hasNextPage, isFetching, fetchMore]);

  const pullRequestsData = pullRequests;

  return (
    <div>
      <div className="pull-requests-header-div">
        <Fade bottom duration={2000} distance="20px">
          <h1 className="pull-requests-header" style={{ color: theme.text }}>
            Pull Requests
          </h1>
        </Fade>
      </div>

      <div className="pull-request-body-div">
        {error && <p style={{ color: "red" }}>Error: {error.message}</p>}

        {/* Show Skeleton only during Initial Load */}
        {networkStatus === NetworkStatus.loading && <LoadingSkeleton />}

        {/* Show Data Without Disappearing on Pagination */}
        {pullRequestsData.map((pullRequest, index) => (
          <PullRequestCard key={index} pullRequest={pullRequest?.node} />
        ))}

        {networkStatus === NetworkStatus.fetchMore && (
  
            <span
              className="iconify"
              data-icon="lineicons:spinner-2-scale"
              style={{ fontSize: "500px", color: theme.text }}
              data-inline="false"
            ></span>

        )}

      </div>
    </div>
  );
};

export default PullRequests;






query.js
============================


import { gql } from '@apollo/client';

export const GET_PULL_REQUESTS = gql`
  query GetPullRequests($after: String, $first: Int!) {
    pullRequests(after: $after, first: $first) {
      edges {
        node {
          id
          title
          url
          state
          mergedBy {
            login
          }
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
      }
      pageInfo {
        endCursor
        hasNextPage
      }
    }
  }
`;


