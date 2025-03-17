import React from "react";
import ExperienceCard from "../../components/experienceCard/ExperienceCard.js";
import "./ExperienceAccordion.css";
import { Accordion, Panel } from "baseui/accordion";
import { useQuery } from "@apollo/client";
import { GET_EXPERIENCES } from "../../api/queries/experienceQueries";
import { LoadingSkeleton } from "../../components/skeleton/LoadingSkeleton";

const capitalize = (str) => {
  if (!str) return "";
  return str.charAt(0).toUpperCase() + str.slice(1);
};

const ExperienceAccordion = ({ theme }) => {
  const { loading, error, data } = useQuery(GET_EXPERIENCES, {
    fetchPolicy: "cache-first",
    errorPolicy: "all",
  });

  const experiencesWithTypes = data?.experiences;

  return (
    <div className="experience-accord">
      {error && <p style={{ color: "red" }}>Error: {error.message}</p>}
      {loading && <LoadingSkeleton />}
      <Accordion>
        {experiencesWithTypes?.map((typeWithExperiences) => (
          <Panel
            className="accord-panel"
            title={capitalize(typeWithExperiences.experienceType)}
            key={typeWithExperiences.title}
            overrides={{
              Header: {
                style: () => ({
                  backgroundColor: theme.body,
                  border: "1px solid",
                  borderRadius: "5px",
                  borderColor: theme.headerColor,
                  marginBottom: "3px",
                  fontFamily: "Google Sans Regular",
                  color: theme.text,
                  ":hover": {
                    color: theme.secondaryText,
                  },
                }),
              },
              Content: {
                style: () => ({
                  backgroundColor: theme.body,
                }),
              },
            }}
          >
            {typeWithExperiences.experiences.map((experience, index) => (
              <ExperienceCard
                key={index}
                index={index}
                totalCards={typeWithExperiences.experiences.length}
                experience={experience}
                theme={theme}
              />
            ))}
          </Panel>
        ))}
      </Accordion>
    </div>
  );
};

export default ExperienceAccordion;
