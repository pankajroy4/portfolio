import React, { memo } from "react";
import styled from "styled-components";
import { useQuery } from "@apollo/client";
import { GET_SOCIAL_MEDIA } from "../../api/queries/socialMediaQueries";

const SocialContainer = styled.div`
  padding: 20px 0;
  display: inline-flex;
  @media (max-width: 768px) {
    justify-content: center;
    align-items: center;
    width: 100%;
  }
`;

const IconWrapper = styled.a`
  text-decoration: none;
  color: white;
  background-color: ${(props) => props.$backgroundColor};
  width: 40px;
  height: 40px;
  display: flex;
  justify-content: center;
  align-items: center;
  border-radius: 50%;
  font-size: 24px;
  transition: transform 0.3s ease;
  margin: 0 8px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);

  &:hover {
    transform: scale(1.2);
  }
`;

const SocialMedia = () => {
  const { loading, error, data } = useQuery(GET_SOCIAL_MEDIA, {
    fetchPolicy: "cache-first",
  });

  const socialMedias = data?.socialMedias || [];
  if (loading || error) return;

  return (
    <SocialContainer>
      {socialMedias.map((media, index) => {
        return (
          <IconWrapper
            key={index}
            href={media.link}
            target="_blank"
            rel="noopener noreferrer"
            $backgroundColor={media.bgHashCode}
          >
            {/* <i className={`fab ${media.fontAwsIconClass}`}></i> */}
            {/* fixed for twitter icon */}
            <span
              className="iconify"
              data-icon={media.fontAwsIconClass}
              data-inline="false"
            ></span>
          </IconWrapper>
        );
      })}
    </SocialContainer>
  );
};

export default memo(SocialMedia);
