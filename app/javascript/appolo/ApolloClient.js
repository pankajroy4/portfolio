import { ApolloClient, InMemoryCache, HttpLink } from "@apollo/client";

const apClient = new ApolloClient({
  link: new HttpLink({
    uri: "https://portfolio.pankajroy.in/graphql",
    // credentials: "include", // If using authentication, include credentials
  }),
  cache: new InMemoryCache(),
});

export default apClient;
