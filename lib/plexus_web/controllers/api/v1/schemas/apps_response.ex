defmodule PlexusWeb.API.V1.Schemas.AppsResponse do
  alias OpenApiSpex.Schema
  alias PlexusWeb.API.V1.Schemas.App
  alias PlexusWeb.API.V1.Schemas.Page
  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "AppsResponse",
    description: "Response schema for a list of applications",
    type: :object,
    properties: %{
      data: %Schema{type: :array, items: App},
      meta: Page
    },
    example: %{
      "data" => [
        %{
          "name" => "YouTube Music",
          "package" => "com.google.android.youtube.tvmusic",
          "scores" => %{
            "native" => %{
              "rating_type" => "native",
              "numerator" => 1.1,
              "total_count" => 21,
              "denominator" => 4
            },
            "micro_g" => %{
              "rating_type" => "micro_g",
              "numerator" => 3.7,
              "total_count" => 43,
              "denominator" => 4
            }
          },
          "icon_url" =>
            "https://play-lh.googleusercontent.com/76AjYITcB0dI0sFqdQjNgXQxRMlDIswbp0BAU_O5Oob-73b6cqKggVlAiNXQAW5Bl1g"
        }
      ],
      "meta" => %{
        "page_number" => 3,
        "limit" => 1,
        "total_count" => 420,
        "total_pages" => 69
      }
    }
  })
end
