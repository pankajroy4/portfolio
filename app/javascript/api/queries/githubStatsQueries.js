import { gql } from "@apollo/client";

export const GET_GITHUB_STATS = gql`
  query GetPullRequestStats {
    pullRequestStats {
      open
      closed
      merged
    }
  }
`;
