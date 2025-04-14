import React from "react";
import "./CertificationCard.css";
import { Fade } from "react-reveal";

const CertificationCard = ({ certificate, theme }) => {
  return (
    <Fade bottom duration={2000} distance="20px">
      <div className="cert-card">
        <div className="content">
          <a
            href={certificate.certificateLink}
            target="_blank"
            rel="noopener noreferrer"
          >
            <div className="content-overlay"></div>
            <div
              className="cert-header"
              style={{ backgroundColor: certificate.colorCode }}
            >
              <img
                className="logo_img"
                src={certificate.logoUrl}
                alt={certificate.altName}
              />
            </div>
            <div className="content-details fadeIn-top">
              <h3 className="content-title" style={{ color: "white" }}>
                Certificate
              </h3>
            </div>
          </a>
        </div>
        <div className="cert-body">
          <h2 className="cert-body-title" style={{ color: theme.text }}>
            {certificate.title}
          </h2>
          <h3
            className="cert-body-subtitle"
            style={{ color: theme.secondaryText }}
          >
            {certificate.subtitle}
          </h3>
        </div>
      </div>
    </Fade>
  );
};

export default CertificationCard;
