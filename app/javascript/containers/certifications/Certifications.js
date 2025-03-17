import React from "react";
import "./Certifications.css";
import { Fade } from "react-reveal";
import CertificationCard from "../../components/certificationCard/CertificationCard";

import { useQuery } from "@apollo/client";
import { GET_CERTIFICATES } from "../../api/queries/certificateQueries";
import { LoadingSkeleton } from "../../components/skeleton/LoadingSkeleton";

const Certifications = ({ theme }) => {
  const { loading, error, data } = useQuery(GET_CERTIFICATES, {
    fetchPolicy: "cache-first",
    errorPolicy: "all",
  });
  const certificates = data?.certificates;

  return (
    <div className="main" id="certs">
      <div className="certs-header-div">
        <Fade bottom duration={2000} distance="20px">
          <h1 className="certs-header" style={{ color: theme.text }}>
            Certifications
          </h1>
        </Fade>
      </div>
      <div className="certs-body-div">
        {error && <p style={{ color: "red" }}>Error: {error.message}</p>}
        {loading && <LoadingSkeleton />}
        {!loading &&
          certificates.map((cert, index) => (
            <CertificationCard key={index} certificate={cert} theme={theme} />
          ))}
      </div>
    </div>
  );
};

export default Certifications;
