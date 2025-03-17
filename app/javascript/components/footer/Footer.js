import React from "react";
import "./Footer.css";
import { Fade } from "react-reveal";
import { useContext } from "react";
import { SiteConfigContext } from "../../containers/Main";
const formatName = (name) =>
  name
    ?.trim()
    ?.split(/(?=[A-Z])/)
    ?.join(" ");

export default function Footer() {
  const { siteConfig } = useContext(SiteConfigContext);
  return (
    <div className="footer-div">
      <Fade>
        <p
          className="footer-text"
          style={{ color: siteConfig?.theme?.secondaryText }}
        >
          𝕮𝖗𝖆𝖋𝖙𝖊𝖉 𝖜𝖎𝖙𝖍 <span role="img">☕</span> & <span role="img">❤️</span>{" "}
          𝖇𝖞 {formatName(siteConfig?.logoName)}
        </p>
        {/* <ToggleSwitch theme={props.theme} onToggle={props.onToggle}/> */}
      </Fade>
    </div>
  );
}
