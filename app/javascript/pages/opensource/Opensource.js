import React, { Component } from "react";
import Header from "../../components/header/Header";
import Footer from "../../components/footer/Footer";
import OpensourceCharts from "../../containers/opensourceCharts/OpensourceCharts";
import PullRequests from "../../containers/pullRequests/PullRequests";
import TopButton from "../../components/topButton/TopButton";
import "./Opensource.css";

class Opensource extends Component {
  render() {
    return (
      <div className="opensource-main">
        <Header theme={this.props.theme} />
        <OpensourceCharts theme={this.props.theme} />
        <PullRequests theme={this.props.theme} />
        <Footer />
        <TopButton theme={this.props.theme} />
      </div>
    );
  }
}

export default Opensource;
