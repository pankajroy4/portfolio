import { gql } from "@apollo/client";

export const GET_DEGREES = gql`
  query GetDegrees {
    degrees {
      id
      title
      subtitle
      altName
      description
      websiteLink
      logoUrl
      duration
    }
  }
`;
