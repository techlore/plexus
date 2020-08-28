const path = require(`path`);
const { createFilePath } = require(`gatsby-source-filesystem`);

exports.createPages = async ({ graphql, actions }) => {
  const { createPage } = actions;
  const result = await graphql(`
    query {
      allPlexusCsv {
        edges {
          node {
            Application
            id
            MicroG_Notes
            MicroG_Rating__1_4_
            Month
            Notes
            Rating__1_4_
            Year
            fields {
              slug
            }
          }
        }
      }
    }
  `);

  result.data.allPlexusCsv.edges.forEach(({ node }) => {
    createPage({
      path: `/applications/${node.fields.slug}`,
      component: path.resolve(`./src/templates/application.js`),
      context: {
        node,
      },
    });
  });
};
