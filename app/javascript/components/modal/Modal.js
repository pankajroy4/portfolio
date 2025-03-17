import React from "react";
import "./Modal.css";
import { Fade } from "react-reveal";

const Modal = ({ theme, resumeUrl, onClose }) => {
  return (
    <div className="modal-overlay" onClick={onClose}>
      <Fade bottom duration={1000} distance="40px">
        <div
          className="modal-content"
          style={{ backgroundColor: theme.secondaryText }}
          onClick={(e) => e.stopPropagation()}
        >
          <button className="modal-close-btn" onClick={onClose}>
            X
          </button>

          {resumeUrl ? (
            <iframe
              src={`${resumeUrl}#toolbar=0&navpanes=0&scrollbar=0&view=fitH`}
              className="modal-iframe"
              title="Resume Preview"
              width="100%"
              height="100%"
              allowFullScreen
            ></iframe>
          ) : (
            <p style={{ color: theme.secondaryText }}>No resume available.</p>
          )}
        </div>
      </Fade>
    </div>
  );
};

export default Modal;
