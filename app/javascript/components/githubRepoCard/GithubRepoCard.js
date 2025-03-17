// import React, { useState, useEffect, useCallback } from "react";
// import ProjectLanguages from "../../components/projectLanguages/ProjectLanguages";
// import "./GithubRepoCard.css";
// import { Fade } from "react-reveal";

// export default function GithubRepoCard({ repo, theme }) {
//   const images = repo.bgImages.map((BgImage) => BgImage.bgImageUrl);
//   const [index, setIndex] = useState(0);
//   const [hovering, setHovering] = useState(false);

//   const cycleImages = useCallback(() => {
//     if (images.length > 1) {
//       setIndex((prevIndex) => (prevIndex + 1) % images.length);
//     }
//   }, [images.length]);

//   useEffect(() => {
//     if (!hovering) {
//       let timeout;
//       const switchImage = () => {
//         cycleImages();
//         timeout = setTimeout(switchImage, 3000);
//       };
//       switchImage();
//       return () => clearTimeout(timeout);
//     }
//   }, [hovering, cycleImages]);

//   return (
//     <Fade bottom duration={3000} distance="60px">
//       <div
//         className={`repo-card-div ${images.length ? "image-available" : ""}`}
//         style={{
//           background: images.length
//             ? hovering
//               ? theme.highlight
//               : `url(${images[index]}) center/cover no-repeat`
//             : theme.highlight,
//           transition: "background 1s ease-in-out",
//         }}
//         onMouseEnter={() => setHovering(true)}
//         onMouseLeave={() => setHovering(false)}
//         onClick={() => window.open(repo.githubUrl, "_blank")}
//       >
//         <Fade bottom duration={2000} distance="40px">
//           <div className="main-div">
//             <div
//               className="info-div"
//               style={{
//                 backgroundColor: theme.highlight,
//                 padding: "10px",
//                 borderRadius: "5px",
//                 opacity: `${hovering || !images.length ? "1" : "0.7"}`,
//               }}
//             >
//               <div className="repo-name-div">
//                 <svg
//                   aria-hidden="true"
//                   className="octicon repo-svg"
//                   height="16"
//                   role="img"
//                   viewBox="0 0 12 16"
//                   width="12"
//                 >
//                   <path
//                     fill-rule="evenodd"
//                     d="M4 9H3V8h1v1zm0-3H3v1h1V6zm0-2H3v1h1V4zm0-2H3v1h1V2zm8-1v12c0 .55-.45 1-1 1H6v2l-1.5-1.5L3 16v-2H1c-.55 0-1-.45-1-1V1c0-.55.45-1 1-1h10c.55 0 1 .45 1 1zm-1 10H1v2h2v-1h3v1h5v-2zm0-10H2v9h9V1z"
//                   ></path>
//                 </svg>
//                 <p className="repo-name" style={{ color: theme.text }}>
//                   {repo.name}
//                 </p>
//               </div>
//               <p
//                 className="repo-description"
//                 style={{
//                   color: theme.text,
//                   display: hovering ? "" : "-webkit-box",
//                 }}
//               >
//                 {repo.description}
//               </p>
//               <div className="repo-details">
//                 <p
//                   className="repo-creation-date subTitle"
//                   style={{ color: theme.secondaryText }}
//                 >
//                   {repo.duration}
//                 </p>
//                 <ProjectLanguages
//                   className="repo-languages"
//                   logos={repo.softwareSkills}
//                 />
//               </div>
//             </div>
//           </div>
//         </Fade>
//       </div>
//     </Fade>
//   );
// }

import React, { useState, useEffect, useCallback } from "react";
import ProjectLanguages from "../../components/projectLanguages/ProjectLanguages";
import "./GithubRepoCard.css";
import { Fade } from "react-reveal";

export default function GithubRepoCard({ repo, theme }) {
  const images = repo.bgImages.map((BgImage) => BgImage.bgImageUrl);
  const [index, setIndex] = useState(0);
  const [hovering, setHovering] = useState(false);

  useEffect(() => {
    images.forEach((src) => {
      const img = new Image();
      img.src = src;
    });
  }, [images]);

  const cycleImages = useCallback(() => {
    if (images.length > 1) {
      setIndex((prevIndex) => (prevIndex + 1) % images.length);
    }
  }, [images.length]);

  useEffect(() => {
    if (!hovering) {
      let timeout;
      const switchImage = () => {
        cycleImages();
        timeout = setTimeout(switchImage, 3000);
      };
      switchImage();
      return () => clearTimeout(timeout);
    }
  }, [hovering, cycleImages]);

  return (
    <Fade bottom duration={3000} distance="60px">
      <div
        className={`repo-card-div ${images.length ? "image-available" : ""}`}
        style={{
          background: theme.highlight,
          position: "relative",
          transition: "opacity 1s ease-in-out",
        }}
        onMouseEnter={() => setHovering(true)}
        onMouseLeave={() => setHovering(false)}
        onClick={() => window.open(repo.githubUrl, "_blank")}
      >
        {images.length > 0 && (
          <img
            src={images[index]}
            alt="repo background"
            className="bg-image"
            style={{
              position: "absolute",
              top: 0,
              left: 0,
              width: "100%",
              height: "100%",
              objectFit: "cover",
              opacity: hovering ? 0 : 0.5,
              transition: "opacity 1s ease-in-out",
            }}
          />
        )}
        <Fade bottom duration={2000} distance="40px">
          <div className="main-div">
            <div
              className="info-div"
              style={{
                backgroundColor: theme.highlight,
                padding: "10px",
                borderRadius: "5px",
                opacity: `${hovering || !images.length ? "1" : "0.7"}`,
              }}
            >
              <div className="repo-name-div">
                <svg
                  aria-hidden="true"
                  className="octicon repo-svg"
                  height="16"
                  role="img"
                  viewBox="0 0 12 16"
                  width="12"
                >
                  <path
                    fill-rule="evenodd"
                    d="M4 9H3V8h1v1zm0-3H3v1h1V6zm0-2H3v1h1V4zm0-2H3v1h1V2zm8-1v12c0 .55-.45 1-1 1H6v2l-1.5-1.5L3 16v-2H1c-.55 0-1-.45-1-1V1c0-.55.45-1 1-1h10c.55 0 1 .45 1 1zm-1 10H1v2h2v-1h3v1h5v-2zm0-10H2v9h9V1z"
                  ></path>
                </svg>
                <p className="repo-name" style={{ color: theme.text }}>
                  {repo.name}
                </p>
              </div>
              <p
                className="repo-description"
                style={{
                  color: theme.text,
                  display: hovering ? "" : "-webkit-box",
                }}
              >
                {repo.description}
              </p>
              <div className="repo-details">
                <p
                  className="repo-creation-date subTitle"
                  style={{ color: theme.secondaryText }}
                >
                  {repo.duration}
                </p>
                <ProjectLanguages
                  className="repo-languages"
                  logos={repo.softwareSkills}
                />
              </div>
            </div>
          </div>
        </Fade>
      </div>
    </Fade>
  );
}
