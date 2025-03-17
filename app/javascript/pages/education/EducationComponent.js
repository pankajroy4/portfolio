import React from "react";
import Header from "../../components/header/Header";
import Footer from "../../components/footer/Footer";
import TopButton from "../../components/topButton/TopButton";
import Educations from "../../containers/education/Educations";
import Certifications from "../../containers/certifications/Certifications";
import CompetitiveSites from "../../components/competitiveSites/CompetitiveSites";
import EducationImg from "./EducationImg";
import "./EducationComponent.css";
import { Fade } from "react-reveal";
import SvgRenderer from "../../components/svgRenderer/SvgRenderer";
import SafeSvgRenderer from "../../components/safeSvgRenderer/SafeSvgRenderer";
import { useSectionData } from "../../api/useSectionData";

const Education = ({ theme }) => {
  const { data } = useSectionData("Education");

  return (
    <div className="education-main">
      <Header theme={theme} />
      <div className="basic-education">
        <Fade bottom duration={2000} distance="40px">
          <div className="heading-div">
            {data.sectionSvgData ? (
              <SafeSvgRenderer
                svgString={data.sectionSvgData}
                className={"heading-img-div"}
              />
            ) : data.sectionImageUrl ? (
              <SvgRenderer
                svgUrl={data.sectionImageUrl}
                theme={theme}
                className={""}
              />
            ) : (
              <div className="heading-img-div">
                <EducationImg theme={theme} />
              </div>
            )}
            <div className="heading-text-div">
              <h1 className="heading-text" style={{ color: theme.text }}>
                {data.sectionName}
              </h1>
              <h3 className="heading-sub-text" style={{ color: theme.text }}>
                {data.subtitle}
              </h3>
              <CompetitiveSites />
            </div>
          </div>
        </Fade>
        <Educations theme={theme} />
        <Certifications theme={theme} />
      </div>
      <Footer />
      <TopButton theme={theme} />
    </div>
  );
};

export default Education;
