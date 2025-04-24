import React, { memo } from "react";
import { useQuery } from "@apollo/client";
import "./SocialMedia.css";
import { GET_SOCIAL_MEDIA } from "../../api/queries/socialMediaQueries";

const SocialMedia = () => {
  const { loading, error, data } = useQuery(GET_SOCIAL_MEDIA, {
    fetchPolicy: "cache-first",
  });

  const socialMedias = data?.socialMedias || [];
  if (loading || error) return;
  return (
    <div className="social-media-div">
      <ul className="social-icons">
        {socialMedias.map((media) => (
          <li
            className="social-sites-inline"
            onClick={() => window.open(media.link, "_blank")}
          >
            <span
              className="iconify"
              data-icon={media.fontAwsIconClass}
              data-inline="false"
            ></span>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default memo(SocialMedia);
