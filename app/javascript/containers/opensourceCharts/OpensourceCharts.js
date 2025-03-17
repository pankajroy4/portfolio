import React, { Component } from "react";
import PullRequestChart from "../../components/pullRequestChart/PullRequestChart.js";
import "./OpensourceCharts.css";

class OpensourceCharts extends Component {
  render() {
    const theme = this.props.theme;
    return (
      <div className="main-div">
        <div className="stats">
          <div className="os-charts-body-div">
            <PullRequestChart theme={theme} />
          </div>
        </div>
      </div>
    );
  }
}

export default OpensourceCharts;
