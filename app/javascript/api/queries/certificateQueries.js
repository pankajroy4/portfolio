import { gql } from "@apollo/client";

export const GET_CERTIFICATES = gql`
  query GetCertificates {
    certificates {
      id
      title
      subtitle
      altName
      certificateLink
      logoUrl
      colorCode
    }
  }
`;
