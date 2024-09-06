defmodule PlexusWeb.API.V1.Schemas.Page do
  alias OpenApiSpex.Schema
  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "Page",
    description: "Page metadata",
    type: :object,
    properties: %{
      page_number: %Schema{type: :integer, description: "Current page number", default: 1},
      limit: %Schema{type: :integer, description: "Max results per page", default: 25},
      total_count: %Schema{type: :integer, description: "Total count of results", readOnly: true},
      total_pages: %Schema{type: :integer, description: "Total count of pages", readOnly: true}
    },
    example: %{
      "page_number" => 3,
      "limit" => 25,
      "total_count" => 420,
      "total_pages" => 69
    }
  })
end
