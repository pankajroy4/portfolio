import { gql } from "@apollo/client";

export const GET_PULL_REQUESTS = gql`
  query GetPullRequests($after: String, $first: Int!) {
    pullRequests(after: $after, first: $first) {
      pullRequests {
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
      pageInfo {
        endCursor
        hasNextPage
      }
    }
  }
`;
