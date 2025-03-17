import React from "react";
import "./CompetitiveSites.css";
import { OverlayTrigger, Tooltip } from "react-bootstrap";
import { useQuery } from "@apollo/client";
import { GET_COMPETITIVE_SITES } from "../../api/queries/competitiveSiteQueries";
import { LoadingSkeleton } from "../skeleton/LoadingSkeleton";

const CompetitiveSites = () => {
  const { loading, error, data } = useQuery(GET_COMPETITIVE_SITES, {
    fetchPolicy: "cache-first",
  });

  if (loading) return [...Array(4)].map((_, i) => <LoadingSkeleton />);
  if (error) return <p style={{ color: "red" }}>Error: {error.message}</p>;
  const logos = data?.competitiveSites || [];

  return (
    <div className="competitive-sites-main-div">
      <ul className="dev-icons">
        {logos.map((logo) => (
          <OverlayTrigger
            key={logo.siteName}
            placement={"top"}
            style={{ marginBottom: "5px" }}
            overlay={
              <Tooltip id={`tooltip-top`}>
                <strong>{logo.siteName}</strong>
              </Tooltip>
            }
          >
            <li className="competitive-sites-inline" name={logo.siteName}>
              <a
                href={logo.profileLink}
                target="_blank"
                rel="noopener noreferrer"
              >
                <span
                  className="iconify"
                  data-icon={logo.iconifyClassname}
                  style={logo.style}
                  data-inline="false"
                ></span>
              </a>
            </li>
          </OverlayTrigger>
        ))}
      </ul>
    </div>
  );
};

export default CompetitiveSites;
