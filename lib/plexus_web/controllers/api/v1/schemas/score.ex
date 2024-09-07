defmodule PlexusWeb.API.V1.Schemas.Score do
  alias OpenApiSpex.Schema
  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "Score",
    description: "A Representation of a Score",
    type: :object,
    properties: %{
      rating_type: %Schema{type: :string, description: "Rating Type", enum: ["micro_g", "native"]},
      numerator: %Schema{type: :number, description: "Numerator"},
      denominator: %Schema{type: :integer, description: "Denominator"},
      total_count: %Schema{type: :string, description: "Total count of ratings"}
    },
    example: %{
      "numerator" => 4.0,
      "denominator" => 4,
      "rating_type" => "micro_g",
      "total_count" => 69
    }
  })
end
