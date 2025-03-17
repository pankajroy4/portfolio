import React from "react";
import "./Button.css";

const onMouseEnter = (event, color, bgColor) => {
  const el = event.target;
  el.style.color = color;
  el.style.backgroundColor = bgColor;
};

const onMouseOut = (event, color, bgColor) => {
  const el = event.target;
  el.style.color = color;
  el.style.backgroundColor = bgColor;
};

export default function ButtonDownloadLink({ text, theme, pdfUrl }) {
  const handleDownload = () => {
    const link = document.createElement("a");
    link.href = pdfUrl;
    link.download = pdfUrl?.split("/").pop();
    link.click();
  };

  return (
    <button
      className="main-button"
      style={{
        color: theme.body,
        backgroundColor: theme.text,
        border: `solid 1px ${theme.text}`,
      }}
      onClick={handleDownload}
      onMouseEnter={(event) => onMouseEnter(event, theme.text, theme.body)}
      onMouseOut={(event) => onMouseOut(event, theme.body, theme.text)}
    >
      {text}
    </button>
  );
}
