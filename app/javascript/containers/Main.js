import React, { createContext, useMemo } from "react";
import { Suspense } from "react";
import { BrowserRouter, Route, Switch } from "react-router-dom";
import { useQuery } from "@apollo/client";
import { GET_SITE_CONFIGURATIONS } from "../api/queries/siteConfigurationQueries";
import Home from "../pages/home/HomeComponent";
import Splash from "../pages/splash/Splash";
import Education from "../pages/education/EducationComponent";
import Experience from "../pages/experience/Experience";
import Opensource from "../pages/opensource/Opensource";
import Contact from "../pages/contact/ContactComponent";
import Projects from "../pages/projects/Projects";
import Error404 from "../pages/errors/error404/Error";
import { LoadingSkeleton } from "../components/skeleton/LoadingSkeleton";
import { ThemeProvider } from "styled-components";
import { GlobalStyles } from "../global";

export const SiteConfigContext = createContext(null);

const LoadingScreen = React.memo(() => (
  <>
    {[...Array(3)].map((_, i) => (
      <LoadingSkeleton key={i} />
    ))}
  </>
));

const Main = () => {
  const { loading, error, data } = useQuery(GET_SITE_CONFIGURATIONS, {
    fetchPolicy: "cache-first",
    errorPolicy: "all",
  });

  const siteConfig = useMemo(() => data?.siteConfigurations?.at(0), [data]);
  if (loading) return <LoadingScreen />;
  if (error) return <p style={{ color: "red" }}> Error: {error?.message} </p>;
  const theme = siteConfig?.theme || {};

  return (
    <Suspense fallback={<LoadingScreen />}>
      <SiteConfigContext.Provider value={{ loading, error, siteConfig }}>
        <ThemeProvider theme={theme}>
          <GlobalStyles />
          <BrowserRouter basename="/">
            <Switch>
              <Route
                path="/"
                exact
                render={(props) =>
                  siteConfig?.splash ? (
                    <Splash {...props} theme={theme} />
                  ) : (
                    <Home {...props} theme={theme} />
                  )
                }
              />
              <Route
                path="/home"
                render={(props) => <Home {...props} theme={theme} />}
              />
              <Route
                path="/experience"
                render={(props) => <Experience {...props} theme={theme} />}
              />
              <Route
                path="/education"
                render={(props) => <Education {...props} theme={theme} />}
              />
              <Route
                path="/repoactivity"
                render={(props) => <Opensource {...props} theme={theme} />}
              />
              <Route
                path="/contact"
                render={(props) => <Contact {...props} theme={theme} />}
              />
              {siteConfig?.splash && (
                <Route
                  path="/splash"
                  render={(props) => <Splash {...props} theme={theme} />}
                />
              )}
              <Route
                path="/projects"
                render={(props) => <Projects {...props} theme={theme} />}
              />
              <Route
                path="*"
                render={(props) => <Error404 {...props} theme={theme} />}
              />
            </Switch>
          </BrowserRouter>
        </ThemeProvider>
      </SiteConfigContext.Provider>
    </Suspense>
  );
};

export default Main;
