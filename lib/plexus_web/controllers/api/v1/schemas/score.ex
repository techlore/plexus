defmodule PlexusWeb.API.V1.Schemas.Score do
  alias OpenApiSpex.Schema
  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "Score",
    description: "A Representation of a Score",
    type: :object,
    properties: %{
      numenator: %Schema{type: :number, description: "Numenator"},
      denominator: %Schema{type: :integer, description: "Denominator"}
    },
    example: %{
      "numerator" => 4.0,
      "denominator" => 4
    }
  })
end
