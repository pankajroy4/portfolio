import React from "react";
import "./SoftwareSkill.css";
import { OverlayTrigger, Tooltip } from "react-bootstrap";

class SoftwareSkill extends React.Component {
  render() {
    return (
      <div>
        <div className="software-skills-main-div">
          <ul className="dev-icons">
            {this.props.logos.map((logo) => {
              return (
                <OverlayTrigger
                  key={logo.skillName}
                  placement={"top"}
                  overlay={
                    <Tooltip id={`tooltip-top`}>
                      <strong>{logo.skillName}</strong>
                    </Tooltip>
                  }
                >
                  <li className="software-skill-inline" name={logo.skillName}>
                    {logo.fontAwsIconClass && (
                      <span
                        className="iconify"
                        data-icon={logo.fontAwsIconClass}
                        style={logo.style}
                        data-inline="false"
                      ></span>
                    )}
                    {!logo.fontAwsIconClass && logo.imageSrc && (
                      <img
                        className="skill-image"
                        style={logo.style}
                        src="./skills/deeplearning_ai_logo.png"
                        alt={logo.skillName}
                      />
                    )}
                  </li>
                </OverlayTrigger>
              );
            })}
          </ul>
        </div>
      </div>
    );
  }
}

export default SoftwareSkill;
