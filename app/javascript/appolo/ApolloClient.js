import { ApolloClient, InMemoryCache, HttpLink } from "@apollo/client";

const apClient = new ApolloClient({
  link: new HttpLink({
    uri: "http://localhost:3000/graphql",
    // credentials: "include", // If using authentication, include credentials
  }),
  cache: new InMemoryCache(),
});

export default apClient;
