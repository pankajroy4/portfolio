import { gql } from "@apollo/client";

export const GET_ABOUTS = gql`
  query GetAbouts {
    abouts {
      id
      name
      designations
      description
      status
    }
  }
`;
