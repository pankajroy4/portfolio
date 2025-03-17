import React from "react";
import Header from "../../components/header/Header";
import Footer from "../../components/footer/Footer";
import GithubRepoCard from "../../components/githubRepoCard/GithubRepoCard";
import Button from "../../components/button/Button";
import TopButton from "../../components/topButton/TopButton";
import { Fade } from "react-reveal";
import "./Projects.css";
import ProjectsImg from "./ProjectsImg";

import SvgRenderer from "../../components/svgRenderer/SvgRenderer";
import SafeSvgRenderer from "../../components/safeSvgRenderer/SafeSvgRenderer";
import { useSectionData } from "../../api/useSectionData";
import { Typewriter } from "react-simple-typewriter";
import { useQuery } from "@apollo/client";
import { GET_PROJECTS } from "../../api/queries/projectQuery";
import { LoadingSkeleton } from "../../components/skeleton/LoadingSkeleton";

const Projects = ({ theme }) => {
  const { data } = useSectionData("Project");

  const { loading, error, data: projectData } = useQuery(GET_PROJECTS, {
    fetchPolicy: "cache-first",
    errorPolicy: "all",
  });

  if (loading) return <LoadingSkeleton />;
  if (error) return <p style={{ color: "red" }}>Error: {error.message}</p>;

  return (
    <div className="projects-main">
      <Header theme={theme} />
      <div className="basic-projects">
        <Fade bottom duration={2000} distance="40px">
          <div className="projects-heading-div">
            {data.sectionSvgData ? (
              <SafeSvgRenderer
                svgString={data.sectionSvgData}
                className={"projects-heading-img-div"}
              />
            ) : data.sectionImageUrl ? (
              <SvgRenderer
                svgUrl={data.sectionImageUrl}
                theme={theme}
                className={""}
              />
            ) : (
              <div className="projects-heading-img-div">
                <ProjectsImg theme={theme} />
              </div>
            )}
            <div className="projects-heading-text-div">
              <h1
                className="projects-heading-text"
                style={{ color: theme.text }}
              >
                {data.title}
              </h1>
              <h3
                className="experience-heading-sub-text"
                style={{ color: theme.text }}
              >
                {/* {data.subtitle} */}
                <Typewriter
                  words={data.others?.typewriter}
                  loop={true}
                  cursor
                  cursorStyle={data.others?.cursor_style}
                  typeSpeed={50}
                  deleteSpeed={20}
                  delaySpeed={1000}
                />
              </h3>
              <p
                className="projects-header-detail-text subTitle"
                style={{ color: theme.secondaryText }}
              >
                {data.description}
              </p>
            </div>
          </div>
        </Fade>
      </div>

      <div className="repo-cards-div-main">
        {projectData.projects.map((repo, index) => (
          <GithubRepoCard key={index} repo={repo} theme={theme} />
        ))}
      </div>

      <Button
        text={data.button?.label}
        className="project-button"
        href={data.button?.to}
        newTab={true}
        theme={theme}
      />

      <Footer />
      <TopButton theme={theme} />
    </div>
  );
};

export default Projects;
