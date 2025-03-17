import { useQuery } from "@apollo/client";
import { GET_SECTION_BY_NAME } from "./queries/sectionQueries";

export function useSectionData(sectionName) {
  const { loading, error, data } = useQuery(GET_SECTION_BY_NAME, {
    variables: { sectionName },
    fetchPolicy: "cache-first",
    errorPolicy: "all",
  });

  return { loading, error, data: data?.section || {} };
}
