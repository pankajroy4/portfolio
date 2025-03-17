import { gql } from "@apollo/client";

export const GET_COMPETITIVE_SITES = gql`
  query GetCompetitiveSites {
    competitiveSites {
      siteName
      iconifyClassname
      style
      profileLink
      position
    }
  }
`;

// for single record
// export const GET_COMPETITIVE_SITE = gql`
//   query GetCompetitiveSite($id: ID!) {
//     competitiveSite(id: $id) {
//       id
//       siteName
//       iconifyClassname
//       style
//       profileLink
//       position
//     }
//   }
// `;
