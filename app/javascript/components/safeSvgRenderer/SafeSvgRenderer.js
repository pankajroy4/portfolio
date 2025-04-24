import React from "react";
import DOMPurify from "dompurify";
import { useContext } from "react";
import { SiteConfigContext } from "../../containers/Main";

const SafeSvgRenderer = ({ svgString, className }) => {
  const { siteConfig } = useContext(SiteConfigContext);
  if (!svgString) return null;
  const theme = siteConfig?.theme || {};

  const applyColors = (svg) => {
    const replacements = {
      "{{imageHighlight}}": theme?.imageHighlight,
      "{{jacketColor}}": theme?.jacketColor,
      "{{compImgHighlight}}": theme?.compImgHighlight,
      "{{headerColor}}": theme?.headerColor,
      "{{body}}": theme?.body,
      "{{text}}": theme?.text,
      "{{expTxtColor}}": theme?.expTxtColor,
      "{{highlight}}": theme?.highlight,
      "{{dark}}": theme?.dark,
      "{{secondaryText}}": theme?.secondaryText,
      "{{splashBg}}": theme?.splashBg,
    };

    return Object.keys(replacements).reduce(
      (updatedSvg, key) =>
        updatedSvg.replace(new RegExp(key, "g"), replacements[key]),
      svg
    );
  };

  const updatedSvgString = applyColors(svgString);
  const sanitizedSvg = DOMPurify.sanitize(updatedSvgString);
  return (
    <div
      className={className}
      dangerouslySetInnerHTML={{ __html: sanitizedSvg }}
    />
  );
};

export default SafeSvgRenderer;
