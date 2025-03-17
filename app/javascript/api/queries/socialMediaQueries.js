import { gql } from "@apollo/client";

export const GET_SOCIAL_MEDIA = gql`
  query GetSocialMedias {
    socialMedias {
      name
      link
      fontAwsIconClass
      bgHashCode
    }
  }
`;
