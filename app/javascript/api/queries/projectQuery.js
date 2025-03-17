import { gql } from "@apollo/client";

export const GET_PROJECTS = gql`
  query GetProjects {
    projects {
      id
      name
      startDate
      endDate
      duration
      description
      githubUrl
      bgImages {
        bgImageUrl
      }
      softwareSkills {
        id
        skillName
        fontAwsIconClass
        style
      }
    }
  }
`;
