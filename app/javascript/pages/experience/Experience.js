import React from "react";
import Header from "../../components/header/Header";
import Footer from "../../components/footer/Footer";
import TopButton from "../../components/topButton/TopButton";
import ExperienceAccordion from "../../containers/experienceAccordion/ExperienceAccordion.js";
import "./Experience.css";
import { Fade } from "react-reveal";
import ExperienceImg from "./ExperienceImg";
import SvgRenderer from "../../components/svgRenderer/SvgRenderer";
import SafeSvgRenderer from "../../components/safeSvgRenderer/SafeSvgRenderer";
import { useSectionData } from "../../api/useSectionData";
import { LoadingSkeleton } from "../../components/skeleton/LoadingSkeleton";

const Experience = ({ theme }) => {
  const { loading: sectionLoading, error: sectionError, data } = useSectionData(
    "Experience"
  );

  return (
    <div className="experience-main">
      <Header theme={theme} />

      {sectionError && (
        <p style={{ color: "red" }}>Error: {sectionError.message}</p>
      )}
      {sectionLoading && <LoadingSkeleton />}

      <div className="basic-experience">
        <Fade bottom duration={2000} distance="40px">
          <div className="experience-heading-div">
            {data.sectionSvgData ? (
              <SafeSvgRenderer
                svgString={data.sectionSvgData}
                className={"experience-heading-img-div"}
              />
            ) : data.sectionImageUrl ? (
              <SvgRenderer
                svgUrl={data.sectionImageUrl}
                theme={theme}
                className={""}
              />
            ) : (
              <div className="experience-heading-img-div">
                <ExperienceImg theme={theme} />
              </div>
            )}
            <div className="experience-heading-text-div">
              <h1
                className="experience-heading-text"
                style={{ color: theme.text }}
              >
                {data.title}
              </h1>
              <h3
                className="experience-heading-sub-text"
                style={{ color: theme.text }}
              >
                {data.subtitle}
              </h3>
              <p
                className="experience-header-detail-text subTitle"
                style={{ color: theme.secondaryText }}
              >
                {data.description}
              </p>
            </div>
          </div>
        </Fade>
      </div>

      <ExperienceAccordion theme={theme} />
      <Footer />
      <TopButton theme={theme} />
    </div>
  );
};

export default Experience;
