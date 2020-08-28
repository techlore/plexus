import React from "react";
import Layout from "../components/layout";
import Applications from "../components/applications";
import SEO from "../components/seo";
import Container from "../components/container";

const IndexPage = () => (
  <Layout>
    <SEO title="Home" />
    <Container>
      <div className="flex">
        <h2 className="my-12 text-4xl tracking-tight leading-10 font-extrabold text-gray-900 sm:leading-none">
          Remove the fear of Android app compatibility <br />
          <span className="text-5xl">
            on <span className="text-brand">de-Googled</span> devices.
          </span>
        </h2>
      </div>
    </Container>
    <Applications />
  </Layout>
);

export default IndexPage;
