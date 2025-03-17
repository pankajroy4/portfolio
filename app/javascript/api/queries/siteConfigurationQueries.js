import { gql } from "@apollo/client";

export const GET_SITE_CONFIGURATIONS = gql`
  query GetSiteConfigurations {
    siteConfigurations {
      splash
      seo
      status
      menuItems
      logoName
      credentials
      sameAs
      address
      theme {
        body
        text
        expTxtColor
        highlight
        dark
        secondaryText
        imageHighlight
        compImgHighlight
        jacketColor
        headerColor
        splashBg
      }
    }
  }
`;
