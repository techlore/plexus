defmodule PlexusWeb.API.V1.Schemas.App do
  alias OpenApiSpex.Schema
  alias PlexusWeb.API.V1.Schemas.AverageScores
  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "App",
    description: "A Representation of an App",
    type: :object,
    properties: %{
      name: %Schema{type: :string, description: "Name"},
      package: %Schema{type: :string, description: "App Package"},
      icon_url: %Schema{type: :string, description: "URL of Icon"},
      scores: AverageScores
    },
    example: %{
      "name" => "Signal",
      "package" => "org.thoughtcrime.securesms",
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
  })
end
