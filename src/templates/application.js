import React from "react";
import { Link } from "gatsby";
import Layout from "../components/layout";
import Container from "../components/container";
import SEO from "../components/seo";
import { getRatingBg, getRatingText } from "../util/applicationUtils";

const Application = ({ pageContext: { node } }) => {
  return (
    <Layout>
      <SEO title={node.Application} />
      <Container>
        <div className="my-8">
          <div className="flex justify-between items-center">
            <div>
              <h2 className="text-4xl font-semibold">{node.Application}</h2>
              <p className="text-gray-500">
                {node.Year} {node.Month}
              </p>
            </div>
            <Link to="/">Go Back</Link>
          </div>
          <div className="mt-4 grid gap-6 grid-cols-1 md:grid-cols-2">
            <div className="bg-white rounded-lg shadow-lg">
              <div
                className={`flex justify-between items-center rounded-t-lg ${getRatingBg(
                  node.Rating__1_4_
                )}`}
              >
                <div className="text-white font-semibold p-4"></div>
                <div className="p-4">
                  <div class="flex justify-center items-center p-1 h-8 w-8 bg-white text-xs leading-4 font-medium rounded-full">
                    <div
                      className={`font-bold ${getRatingText(
                        node.Rating__1_4_
                      )}`}
                    >
                      {node.Rating__1_4_}
                    </div>
                  </div>
                </div>
              </div>
              <div className="p-4">
                <div className="flex flex-col">
                  <div></div>
                  <div>{node.Notes}</div>
                </div>
              </div>
            </div>
            <div className="bg-white rounded-lg shadow-lg">
              <div
                className={`flex justify-between items-center rounded-t-lg ${getRatingBg(
                  node.MicroG_Rating__1_4_
                )}`}
              >
                <div className="text-white font-semibold p-4">
                  &mu; (microG)
                </div>
                <div className="p-4">
                  <div class="flex justify-center items-center p-1 h-8 w-8 bg-white text-xs leading-4 font-medium rounded-full">
                    <div
                      className={`font-bold ${getRatingText(
                        node.MicroG_Rating__1_4_
                      )}`}
                    >
                      {node.MicroG_Rating__1_4_}
                    </div>
                  </div>
                </div>
              </div>
              <div className="p-4">
                <div className="flex flex-col">
                  <div></div>
                  <div>{node.MicroG_Notes}</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </Container>
    </Layout>
  );
};

export default Application;
