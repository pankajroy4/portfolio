import { gql } from "@apollo/client";

export const GET_SKILLS = gql`
  query GetSkills {
    skills {
      id
      title
      filename
      skillHighlight
      skillImageUrl
      skillSvgData
      softwareSkills {
        id
        skillName
        fontAwsIconClass
        style
      }
    }
  }
`;
