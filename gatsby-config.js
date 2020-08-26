module.exports = {
  siteMetadata: {
    title: `Plexus`,
    description: `Remove the fear of Android app compatibility on de-Googled devices.`,
    author: `@tomkonidas`,
  },
  plugins: [
    `gatsby-plugin-react-helmet`,
    {
      resolve: `gatsby-source-filesystem`,
      options: {
        name: `images`,
        path: `${__dirname}/src/images`,
      },
    },
    {
      resolve: `gatsby-source-filesystem`,
      options: {
        name: `data`,
        path: `${__dirname}/src/data/`,
      },
    },
    `gatsby-transformer-csv`,
    `gatsby-transformer-sharp`,
    `gatsby-plugin-sharp`,
    {
      resolve: `gatsby-plugin-manifest`,
      options: {
        name: `plexus`,
        short_name: `plexus`,
        start_url: `/`,
        background_color: `#e74c3c`,
        theme_color: `#e74c3c`,
        display: `minimal-ui`,
        icon: `src/images/plexus-icon.png`, // This path is relative to the root of the site.
      },
    },
    `gatsby-plugin-postcss`,
    {
      resolve: "gatsby-plugin-slug-field",
      options: {
        filter: { internal: { type: "PlexusCsv" } },
        source: "Application",
        fieldName: "slug",
      },
    },
    // this (optional) plugin enables Progressive Web App + Offline functionality
    // To learn more, visit: https://gatsby.dev/offline
    // `gatsby-plugin-offline`,
  ],
};
