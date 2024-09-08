defmodule PlexusWeb.API.V1.Schemas.RatingResponse do
  alias PlexusWeb.API.V1.Schemas.Rating
  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "RatingResponse",
    description: "Response Schema for a Rating",
    type: :object,
    properties: %{
      data: Rating
    },
    example: %{
      "data" => [
        %{
          "id" => "72f5d88e-a467-4729-998f-db1edcfad6bc",
          "app_version" => "7.15.4",
          "rating_type" => "native",
          "app_package" => "org.thoughtcrime.securesms",
          "score" => %{"numerator" => 4, "denominator" => 4},
          "android_version" => "14.0",
          "app_build_number" => 145_100,
          "installation_source" => "google_play_alternative",
          "notes" => nil,
          "rom_build" => "2024083100",
          "rom_name" => "GrapheneOS"
        }
      ]
    }
  })
end
