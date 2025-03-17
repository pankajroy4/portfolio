// import React, { Component } from "react";
// import "./Educations.css";
// import DegreeCard from "../../components/degreeCard/DegreeCard.js";
// import { degrees } from "../../portfolio";
// import { Fade } from "react-reveal";

// class Educations extends Component {
//   render() {
//     const theme = this.props.theme;
//     return (
//       <div className="main" id="educations">
//         <div className="educations-header-div">
//           <Fade bottom duration={2000} distance="20px">
//             <h1 className="educations-header" style={{ color: theme.text }}>
//               Degrees Received
//             </h1>
//           </Fade>
//         </div>
//         <div className="educations-body-div">
//           {degrees.degrees.map((degree) => {
//             return <DegreeCard degree={degree} theme={theme} />;
//           })}
//         </div>
//       </div>
//     );
//   }
// }

// export default Educations;

import React from "react";
import "./Educations.css";
import DegreeCard from "../../components/degreeCard/DegreeCard.js";
import { Fade } from "react-reveal";
import { useQuery } from "@apollo/client";
import { GET_DEGREES } from "../../api/queries/degreeQueries";
import { LoadingSkeleton } from "../../components/skeleton/LoadingSkeleton";

const Educations = ({ theme }) => {
  const { loading, error, data } = useQuery(GET_DEGREES, {
    fetchPolicy: "cache-first",
    errorPolicy: "all",
  });
  const degrees = data?.degrees;

  return (
    <div className="main" id="educations">
      <div className="educations-header-div">
        <Fade bottom duration={2000} distance="20px">
          <h1 className="educations-header" style={{ color: theme.text }}>
            Degrees Received
          </h1>
        </Fade>
      </div>
      <div className="educations-body-div">
        {error && <p style={{ color: "red" }}>Error: {error.message}</p>}
        {loading && <LoadingSkeleton />}
        {!loading &&
          degrees?.map((degree, index) => (
            <DegreeCard key={index} degree={degree} theme={theme} />
          ))}
      </div>
    </div>
  );
};

export default Educations;
