defmodule PlexusWeb.API.V1.Schemas.App do
  alias OpenApiSpex.Schema
  alias PlexusWeb.API.V1.Schemas.Scores
  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "App",
    description: "A Representation of an App",
    type: :object,
    properties: %{
      name: %Schema{type: :string, description: "Name"},
      package: %Schema{type: :string, description: "Android Package"},
      icon_url: %Schema{type: :string, description: "URL of Icon"},
      scores: Scores
    },
    example: %{
      "name" => "YouTube Music",
      "package" => "com.google.android.youtube.tvmusic",
      "scores" => %{
        "native" => %{
          "rating_type" => "native",
          "numerator" => 1.2,
          "total_count" => 21,
          "denominator" => 4
        },
        "micro_g" => %{
          "rating_type" => "micro_g",
          "numerator" => 4.0,
          "total_count" => 44,
          "denominator" => 4
        }
      },
      "icon_url" =>
        "https://play-lh.googleusercontent.com/76AjYITcB0dI0sFqdQjNgXQxRMlDIswbp0BAU_O5Oob-73b6cqKggVlAiNXQAW5Bl1g"
    }
  })
end
