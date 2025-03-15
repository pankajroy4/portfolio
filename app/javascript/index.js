import React from "react";
import ReactDOM from "react-dom";
import { BaseProvider, LightTheme } from "baseui";
import { Provider as StyletronProvider } from "styletron-react";
import { Client as Styletron } from "styletron-engine-atomic";
import { ApolloProvider } from "@apollo/client";
import apClient from "./appolo/ApolloClient";

import "./index.css";
import App from "./App";
import "./assets/font-awesome/css/all.css";
import "./assets/font-awesome/js/all";
import { AuthProvider } from "./AuthContext";

const engine = new Styletron();
document.addEventListener("turbo:load", () => {
  const rootElement = document.getElementById("root");
  if (rootElement) {
    ReactDOM.render(
      <StyletronProvider value={engine}>
        <BaseProvider theme={LightTheme}>
          <ApolloProvider client={apClient}>
            <AuthProvider>
              <App />
            </AuthProvider>
          </ApolloProvider>
        </BaseProvider>
      </StyletronProvider>,
      rootElement
    );
  }
});
