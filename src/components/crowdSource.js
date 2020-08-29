import React from "react";
import Container from "./container";

const CrowdSource = () => {
  return (
    <Container>
      <h4 className="text-lg">
        Plexus is a crowd-sourced project that relies on the community. You can
        contribute{" "}
        <a
          className="text-brand font-semibold hover:text-brand-dark"
          href="https://github.com/techlore-official/plexus"
          rel="noopener noreferrer"
        >
          here
        </a>
        .
      </h4>
    </Container>
  );
};

export default CrowdSource;
