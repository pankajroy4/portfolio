import { gql } from "@apollo/client";

export const GET_EXPERIENCES = gql`
  query GetExperiences {
    experiences {
      experienceType
      experiences {
        id
        title
        companyName
        companyUrl
        companyLogoImage
        description
        location
        startDate
        endDate
        logoColor
        position
        duration
      }
    }
  }
`;
