import React from "react";
import "./Skills.css";
import SoftwareSkill from "../../components/softwareSkills/SoftwareSkill";
import { Fade } from "react-reveal";
import DataScienceImg from "./DataScienceImg";
import FullStackImg from "./FullStackImg";
import CloudInfraImg from "./CloudInfraImg";
import DesignImg from "./DesignImg";

import { useQuery } from "@apollo/client";
import { GET_SKILLS } from "../../api/queries/skillQueries";

import SvgRenderer from "../../components/svgRenderer/SvgRenderer";
import SafeSvgRenderer from "../../components/safeSvgRenderer/SafeSvgRenderer";
import { LoadingSkeleton } from "../../components/skeleton/LoadingSkeleton";

function GetSkillSvg({ fileName, theme }) {
  switch (fileName) {
    case "DataScienceImg":
      return <DataScienceImg theme={theme} />;
    case "FullStackImg":
      return <FullStackImg theme={theme} />;
    case "CloudInfraImg":
      return <CloudInfraImg theme={theme} />;
    default:
      return <DesignImg theme={theme} />;
  }
}

const SkillSection = ({ theme }) => {
  const { loading, error, data } = useQuery(GET_SKILLS, {
    fetchPolicy: "cache-first",
  });

  if (loading) return [...Array(3)].map((_, i) => <LoadingSkeleton key={i} />);
  if (error) return <p style={{ color: "red" }}>Error: {error.message}</p>;
  const skills = data?.skills || [];

  return (
    <div>
      {skills.map((skill, i) => {
        return (
          <div key={i} className="skills-main-div">
            <Fade left duration={2000}>
              {skill.skillSvgData ? (
                <SafeSvgRenderer
                  svgString={skill.skillSvgData}
                  className={"skills-image-div"}
                />
              ) : skill.skillImageUrl ? (
                <SvgRenderer
                  svgUrl={skill.skillImageUrl}
                  theme={theme}
                  className={"skills-image-div"}
                />
              ) : (
                <Fade left duration={2000}>
                  <div className="skills-image-div">
                    <GetSkillSvg fileName={skill.filename} theme={theme} />
                  </div>
                </Fade>
              )}
            </Fade>

            <div className="skills-text-div">
              <Fade right duration={1000}>
                <h1 className="skills-heading" style={{ color: theme.text }}>
                  {skill.title}
                </h1>
              </Fade>
              <Fade right duration={1500}>
                <SoftwareSkill logos={skill.softwareSkills} />
              </Fade>
              <Fade right duration={2000}>
                <div>
                  {skill.skillHighlight.map((skillSentence, i) => {
                    return (
                      <p
                        key={i}
                        className="subTitle skills-text"
                        style={{ color: theme.secondaryText }}
                      >
                        {skillSentence}
                      </p>
                    );
                  })}
                </div>
              </Fade>
            </div>
          </div>
        );
      })}
    </div>
  );
};

export default SkillSection;
