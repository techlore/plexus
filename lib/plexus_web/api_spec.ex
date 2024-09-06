defmodule PlexusWeb.ApiSpec do
  @behaviour OpenApiSpex.OpenApi

  @impl OpenApiSpex.OpenApi
  def spec do
    OpenApiSpex.resolve_schema_modules(%OpenApiSpex.OpenApi{
      servers: [
        OpenApiSpex.Server.from_endpoint(PlexusWeb.Endpoint)
      ],
      info: %OpenApiSpex.Info{
        title: "Plexus",
        version: to_string(Application.spec(:plexus, :vsn))
      },
      paths: OpenApiSpex.Paths.from_router(PlexusWeb.Router)
    })
  end
end
