defmodule PlexusWeb.API.V1.Schemas.AverageScores do
  alias PlexusWeb.API.V1.Schemas.AppScore
  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "Scores",
    description: "The Average Scores of an App",
    type: :object,
    properties: %{
      micro_g: AppScore,
      native: AppScore
    },
    derive?: false,
    example: %{
      "micro_g" => %{
        "numerator" => 4.0,
        "denominator" => 4,
        "rating_type" => "micro_g",
        "total_count" => 69
      },
      "native" => %{
        "numerator" => 3.7,
        "denominator" => 4,
        "rating_type" => "native",
        "total_count" => 69
      }
    }
  })
end
