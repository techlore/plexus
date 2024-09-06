defmodule PlexusWeb.API.V1.Schemas.Scores do
  alias PlexusWeb.API.V1.Schemas.Score
  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "Scores",
    description: "A Representation of Scores",
    type: :object,
    properties: %{
      micro_g: Score,
      native: Score
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
