import React from "react";
import { ReactSVG } from "react-svg";

const SvgRenderer = ({
  svgUrl,
  theme,
  width = "80%",
  height = "auto",
  className,
}) => {
  if (!svgUrl) return null;
  const isSvg = svgUrl.toLowerCase().endsWith(".svg");

  return isSvg ? (
    <ReactSVG
      src={svgUrl}
      beforeInjection={(svg) => {
        if (width) svg.setAttribute("width", width);
        if (height) svg.setAttribute("height", height);
        svg
          .querySelectorAll("path, circle, rect, polygon")
          .forEach((element) => {
            element.setAttribute("fill", theme.dark);
            element.setAttribute("stroke", theme.dark);
          });
      }}
      className={className}
    />
  ) : (
    <div className={className}>
      <img
        src={svgUrl}
        alt="Rendered Image"
        style={{
          objectFit: "contain",
        }}
      />
    </div>
  );
};

export default SvgRenderer;
