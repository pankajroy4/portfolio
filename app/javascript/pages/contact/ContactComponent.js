import React, { useState } from "react";
import Header from "../../components/header/Header";
import Footer from "../../components/footer/Footer";
import TopButton from "../../components/topButton/TopButton";
import SocialMedia from "../../components/socialMedia/SocialMedia";
import Button from "../../components/button/Button";
import ButtonLink from "../../components/button/ButtonLink";
import ButtonDownloadLink from "../../components/button/ButtonDownloadLink";
import AddressImg from "./AddressImg";
import { Fade } from "react-reveal";
import "./ContactComponent.css";

import SvgRenderer from "../../components/svgRenderer/SvgRenderer";
import SafeSvgRenderer from "../../components/safeSvgRenderer/SafeSvgRenderer";
import { useSectionData } from "../../api/useSectionData";
import { GET_DOCUMENTS } from "../../api/queries/documentQueries";
import { useQuery } from "@apollo/client";
import Modal from "../../components/modal/Modal";

const Contact = ({ theme }) => {
  const [showModal, setShowModal] = useState(false);
  const [resumeUrl, setResumeUrl] = useState("");

  const { data: docsData, loading, error } = useQuery(GET_DOCUMENTS, {
    variables: { documentType: "resume" },
    fetchPolicy: "cache-first",
    errorPolicy: "all",
  });

  const url = docsData?.documents?.at(0)?.url;
  const { data } = useSectionData("Contact");
  const { data: addressData } = useSectionData("Address");

  const handleViewResume = () => {
    if (docsData?.documents?.length > 0) {
      setResumeUrl(docsData?.documents[0].url);
      setShowModal(true);
    }
  };

  return (
    <div className="contact-main">
      <Header theme={theme} />
      <div className="basic-contact">
        <Fade bottom duration={1000} distance="40px">
          <div className="contact-heading-div">
            {data.sectionSvgData ? (
              <SafeSvgRenderer
                svgString={data.sectionSvgData}
                className={"contact-heading-img-div"}
              />
            ) : data.sectionImageUrl ? (
              <SvgRenderer
                svgUrl={data.sectionImageUrl}
                theme={theme}
                className={"contact-heading-img-div"}
              />
            ) : (
              <div className="contact-heading-img-div">
                <img
                  // src={`/images/${ContactData.profile_image_path}`}
                  alt="Profile"
                />
              </div>
            )}

            <div className="contact-heading-text-div">
              <h1
                className="contact-heading-text"
                style={{ color: theme.text }}
              >
                {data.title}
              </h1>
              <p
                className="contact-header-detail-text subTitle"
                style={{ color: theme.secondaryText }}
              >
                {data.description}
              </p>
              <SocialMedia theme={theme} />
              <div className="resume-btn-div">
                <ButtonDownloadLink
                  text="Download Resume"
                  theme={theme}
                  pdfUrl={url}
                />
                <ButtonLink
                  text="See My Resume"
                  theme={theme}
                  onClick={handleViewResume}
                />
              </div>
            </div>
          </div>
        </Fade>

        <Fade top duration={3000} distance="70px">
          <div className="address-heading-div">
            <div className="address-heading-text-div">
              <h1
                className="address-heading-text"
                style={{ color: theme.text }}
              >
                {addressData?.title}
              </h1>

              <p
                className="contact-header-detail-text subTitle"
                style={{
                  color: theme.secondaryText,
                  display: "flex",
                  alignItems: "center",
                  justifyContent: "center",
                  gap: "6px",
                }}
              >
                <span
                  className="iconify"
                  data-icon="subway:location-3"
                  style={{ color: theme.secondaryText, fontSize: "18px" }}
                  data-inline="false"
                ></span>
                <span>{addressData?.description}</span>
              </p>

              <p
                className="contact-header-detail-text subTitle"
                style={{
                  color: theme.secondaryText,
                  display: "flex",
                  alignItems: "center",
                  justifyContent: "center",
                  gap: "6px",
                }}
              >
                <span
                  className="iconify"
                  data-icon="ic:baseline-email"
                  style={{ color: theme.secondaryText, fontSize: "18px" }}
                  data-inline="false"
                ></span>
                <span>{addressData?.others?.email}</span>
              </p>

              <p
                className="contact-header-detail-text subTitle"
                style={{
                  color: theme.secondaryText,
                  display: "flex",
                  alignItems: "center",
                  justifyContent: "center",
                  gap: "6px",
                }}
              >
                <span
                  className="iconify"
                  data-icon="ri:phone-fill"
                  style={{ color: theme.secondaryText, fontSize: "18px" }}
                  data-inline="false"
                ></span>
                <span>{addressData?.others?.phone}</span>
              </p>

              <div className="address-btn-div">
                <Button
                  text={addressData?.button?.label}
                  newTab={true}
                  href={addressData?.button?.to}
                  theme={theme}
                />
              </div>
              <div className="map-container">
                <iframe
                  title="Google Map"
                  src={addressData?.button?.map_embed_src}
                  width="100%"
                  height="400"
                  allowFullScreen=""
                  loading="lazy"
                ></iframe>
              </div>
            </div>
            {addressData.sectionSvgData ? (
              <SafeSvgRenderer
                svgString={addressData.sectionSvgData}
                className={"contact-heading-img-div"}
              />
            ) : addressData.sectionImageUrl ? (
              <SvgRenderer
                svgUrl={addressData.sectionImageUrl}
                theme={theme}
                className={""}
              />
            ) : (
              <div className="contact-heading-img-div">
                <AddressImg theme={theme} />
              </div>
            )}
          </div>
        </Fade>
      </div>

      {showModal && (
        <Modal
          theme={theme}
          resumeUrl={resumeUrl}
          onClose={() => setShowModal(false)}
        />
      )}

      <Footer />
      <TopButton theme={theme} />
    </div>
  );
};

export default Contact;
