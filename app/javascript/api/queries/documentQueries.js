import { gql } from "@apollo/client";

export const GET_DOCUMENTS = gql`
  query getDocuments($documentType: String!) {
    documents(documentType: $documentType) {
      title
      url
      documentType
      status
    }
  }
`;

// export function fetchDocuments(type) {
//   const { data, loading, error } = useQuery(GET_DOCUMENTS, {
//     variables: { documentType: type },
//     fetchPolicy: "cache-first",
//     errorPolicy: "all",
//   });

//   if (loading) return <p>Loading...</p>;
//   if (error) return <p>Error fetching documents</p>;

//   return data.documents;
// }
