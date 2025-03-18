import React, { useEffect, useState } from "react";
import "./PullRequests.css";
import { Fade } from "react-reveal";
import PullRequestCard from "../../components/pullRequestCard/PullRequestCard";
import { useQuery } from "@apollo/client";
import { GET_PULL_REQUESTS } from "../../api/queries/pullRequestsQuery";
import { PullReqLoading } from "../../components/skeleton/LoadingSkeleton";
import Error500 from "../../pages/errors/error500/Error";

const PullRequests = ({ theme }) => {
  const { loading, error, data, fetchMore } = useQuery(GET_PULL_REQUESTS, {
    variables: { after: null, first: 10 },
    notifyOnNetworkStatusChange: true,
  });

  const [isFetching, setIsFetching] = useState(false);

  useEffect(() => {
    const handleScroll = () => {
      if (
        window.innerHeight + document.documentElement.scrollTop >=
        document.documentElement.offsetHeight - 100
      ) {
        const pageInfo = data?.pullRequests?.pageInfo;
        if (pageInfo?.hasNextPage && !isFetching) {
          setIsFetching(true);
          fetchMore({
            variables: { after: pageInfo.endCursor, first: 10 },
            updateQuery: (prevResult, { fetchMoreResult }) => {
              if (!fetchMoreResult) return prevResult;

              return {
                pullRequests: {
                  ...fetchMoreResult.pullRequests,
                  pullRequests: [
                    ...prevResult.pullRequests.pullRequests,
                    ...fetchMoreResult.pullRequests.pullRequests,
                  ],
                },
              };
            },
          }).finally(() => setIsFetching(false));
        }
      }
    };

    window.addEventListener("scroll", handleScroll);
    return () => window.removeEventListener("scroll", handleScroll);
  }, [data, fetchMore, isFetching]);

  return (
    <div>
      <div className="pull-requests-header-div">
        <Fade bottom duration={2000} distance="20px">
          <h1 className="pull-requests-header" style={{ color: theme.text }}>
            Pull Requests
          </h1>
        </Fade>
      </div>

      <div className="pull-request-body-div">
        {error && <Error500 theme={theme}/>}
        {loading && !isFetching && <PullReqLoading />}
        {data?.pullRequests?.pullRequests.map((pullRequest, index) => (
          <PullRequestCard key={index} pullRequest={pullRequest} />
        ))}
        {isFetching && <PullReqLoading />}
      </div>
    </div>
  );
};

export default PullRequests;
