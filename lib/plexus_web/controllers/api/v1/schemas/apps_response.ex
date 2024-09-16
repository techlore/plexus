defmodule PlexusWeb.API.V1.Schemas.AppsResponse do
  alias OpenApiSpex.Schema
  alias PlexusWeb.API.V1.Schemas.App
  alias PlexusWeb.API.V1.Schemas.Page
  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "AppsResponse",
    description: "Response Schema for a List of Applications",
    type: :object,
    properties: %{
      data: %Schema{type: :array, items: App},
      meta: Page
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
      ],
      "meta" => %{
        "page_number" => 1,
        "limit" => 1,
        "total_count" => 420,
        "total_pages" => 69
      }
    }
  })
end
