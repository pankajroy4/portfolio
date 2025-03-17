import { gql } from "@apollo/client";

export const GET_SECTIONS = gql`
  query GetSections {
    sections
  }
`;

export const GET_SECTION_BY_NAME = gql`
  query GetSection($sectionName: String!) {
    section(sectionName: $sectionName) {
      id
      sectionName
      title
      subtitle
      sectionImageUrl
      sectionSvgData
      description
      button
      others
    }
  }
`;
