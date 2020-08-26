import React from "react";
import Layout from "../components/layout";
import Applications from "../components/applications";
import SEO from "../components/seo";

const IndexPage = () => (
  <Layout>
    <SEO title="Home" />
    <Applications />
  </Layout>
);

export default IndexPage;
