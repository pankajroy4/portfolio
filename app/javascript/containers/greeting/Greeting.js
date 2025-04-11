import React from "react";
import "./Greeting.css";
import SocialMedia from "../../components/socialMedia/SocialMedia";
import "../../components/button/Button.css";
import { Fade } from "react-reveal";
import Pulse from "react-reveal/Pulse";
import FeelingProud from "./FeelingProud";
import SvgRenderer from "../../components/svgRenderer/SvgRenderer";
import SafeSvgRenderer from "../../components/safeSvgRenderer/SafeSvgRenderer";
import { Typewriter } from "react-simple-typewriter";
import { LoadingSkeleton } from "../../components/skeleton/LoadingSkeleton";
import { useSectionData } from "../../api/useSectionData";
import Button from "../../components/button/Button";

export default function Greeting(props) {
  const theme = props.theme;
  const { loading, error, data: greeting } = useSectionData("Greeting");

  if (loading) return <LoadingSkeleton />;
  if (error) return <p style={{ color: "red" }}>Error: {error.message}</p>;

  return (
    <Fade bottom duration={2000} distance="40px">
      <div className="greet-main" id="greeting">
        <div className="greeting-main">
          <div className="greeting-text-div">
            <div>
              <h1 className="greeting-text" style={{ color: theme.text }}>
                {greeting?.title}{" "}
                <span className="wave" role="img" aria-labelledby="wave">
                  {" "}
                  {greeting?.others?.wave_emoji}{" "}
                </span>
              </h1>
              <h3 className="greeting-typewriter" style={{ color: theme.text }}>
                <Typewriter
                  words={greeting.others?.typewriter}
                  loop={true}
                  cursor
                  cursorStyle={greeting.others?.cursor_style}
                  typeSpeed={100}
                  deleteSpeed={50}
                  delaySpeed={1000}
                />
              </h3>
              <p
                className="greeting-text-p subTitle"
                style={{ color: theme.secondaryText }}
              >
                <Pulse duration={1500}>{greeting.description}</Pulse>
              </p>
              <SocialMedia theme={theme} />
              <div className="portfolio-repo-btn-div">
                <Pulse duration={1500}>
                  <Button
                    newTab={true}
                    href={greeting.button?.to}
                    theme={theme}
                    className="portfolio-repo-btn"
                    text={greeting.button?.label}
                  />
                </Pulse>
              </div>
            </div>
          </div>
          {greeting.sectionSvgData ? (
            <SafeSvgRenderer
              svgString={greeting.sectionSvgData}
              className={"greeting-image-div"}
            />
          ) : greeting.sectionImageUrl ? (
            <SvgRenderer
              svgUrl={greeting.sectionImageUrl}
              theme={theme}
              className={"greeting-image-div"}
            />
          ) : (
            <div className="greeting-image-div">
              <FeelingProud theme={theme} />
            </div>
          )}
        </div>
      </div>
    </Fade>
  );
}
