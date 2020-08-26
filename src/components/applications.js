import React, { useState } from "react";
import { useStaticQuery, graphql } from "gatsby";
import Container from "./container";
import ApplicationCard from "./applicationCard";

const Applications = () => {
  const data = useStaticQuery(graphql`
    query ApplicationsQuery {
      allPlexusCsv {
        edges {
          node {
            id
            Application
            Month
            Year
            Rating__1_4_
            fields {
              slug
            }
          }
        }
      }
    }
  `);

  const [search, setSearch] = useState("");

  return (
    <div className="mt-8">
      <Container>
        <div>
          <input
            onChange={(e) => setSearch(e.target.value)}
            value={search}
            id="application"
            className="form-input p-3 block w-full sm:text-md sm:leading-5 rounded-md shadow-sm outline-none border border-gray-400 focus:border-purple-300"
            placeholder="YouTube"
            aria-describedby="application-optional"
          />
        </div>
        <div className="mt-2 mb-8 py-3">
          <ul className="mt-3 grid grid-cols-1 gap-4 sm:gap-5 sm:grid-cols-2 lg:grid-cols-3">
            {search &&
              data.allPlexusCsv.edges
                .filter(({ node }) =>
                  node.Application.toLowerCase().includes(search.toLowerCase())
                )
                .map(({ node }) => (
                  <li
                    className="col-span-1 flex shadow-sm rounded-md"
                    key={node.id}
                  >
                    <ApplicationCard app={node} />
                  </li>
                ))}
          </ul>
        </div>
      </Container>
    </div>
  );
};

export default Applications;
