defmodule PlexusWeb.API.V1.Schemas.AppResponse do
  alias PlexusWeb.API.V1.Schemas.App
  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "AppResponse",
    description: "Response Schema for an Application",
    type: :object,
    properties: %{
      data: App
    },
    example: %{
      "data" => [
        %{
          "name" => "Signal",
          "package" => "org.thoughtcrime.securesms",
          "updated_at" => "2024-04-30T22:41:19Z",
          "scores" => %{
            "native" => %{
              "rating_type" => "native",
              "numerator" => 3.86,
              "denominator" => 4,
              "total_count" => 28
            },
            "micro_g" => %{
              "rating_type" => "micro_g",
              "numerator" => 3.92,
              "denominator" => 4,
              "total_count" => 25
            }
          },
          "icon_url" =>
            "https://play-lh.googleusercontent.com/jCln_XT8Ruzp7loH1S6yM-ZzzpLP1kZ3CCdXVEo0tP2w5HNtWQds6lo6aLxLIjiW_X8"
        }
      ]
    }
  })
end
