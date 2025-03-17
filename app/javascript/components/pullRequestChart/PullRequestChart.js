import React from "react";
import { Doughnut } from "react-chartjs-2";
import { Fade } from "react-reveal";
import "./PullRequestChart.css";
import { useQuery } from "@apollo/client";
import { GET_GITHUB_STATS } from "../../api/queries/githubStatsQueries";

const PullRequestChart = ({ theme }) => {
  const { loading, error, data: repoData } = useQuery(GET_GITHUB_STATS, {
    fetchPolicy: "cache-first",
    errorPolicy: "all",
  });

  const repoStats = repoData?.pullRequestStats;
  const data = {
    labels: ["Open", "Merged", "Closed"],
    datasets: [
      {
        data: [repoStats?.open, repoStats?.merged, repoStats?.closed],
        backgroundColor: ["#28a745", "#6f42c1", "#d73a49"],
        hoverBackgroundColor: ["#28a745dd", "#6f42c1dd", "#d73a49dd"],
      },
    ],
  };

  return (
    <div className="pr-chart">
      <Fade bottom duration={2000} distance="20px">
        <h2 className="pr-chart-header">Pull Request Distribution</h2>
      </Fade>
      {loading && (
        <div className="spinner">
          <span
            className="iconify spinner-icon"
            data-icon="lineicons:spinner-2-sacle"
            data-inline="false"
            color={theme.text}
          ></span>
        </div>
      )}
      {!loading && !error && (
        <Doughnut
          data={data}
          options={{
            padding: "0",
            margin: "0",
            responsive: true,
            maintainAspectRatio: true,
            animation: {
              duration: 4000,
            },
          }}
        />
      )}
    </div>
  );
};

export default PullRequestChart;
