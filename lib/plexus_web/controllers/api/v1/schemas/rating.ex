defmodule PlexusWeb.API.V1.Schemas.Rating do
  alias OpenApiSpex.Schema
  alias PlexusWeb.API.V1.Schemas.Score
  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "Rating",
    description: "A Representation of User Rating",
    type: :object,
    properties: %{
      id: %Schema{type: :string, description: "Unique Identifier"},
      android_version: %Schema{type: :string, description: "Android Version"},
      app_package: %Schema{type: :string, description: "App Package"},
      app_version: %Schema{type: :string, description: "App Version"},
      app_build_number: %Schema{type: :integer, format: :int64, description: "App Build Number"},
      rom_name: %Schema{type: :string, description: "ROM Name"},
      rom_build: %Schema{type: :string, description: "ROM Build"},
      installation_source: %Schema{type: :string, description: "Installation Source"},
      score: Score,
      notes: %Schema{type: :string, description: "Notes", nullable: true},
      rating_type: %Schema{type: :string, description: "Rating Type", enum: ["micro_g", "native"]}
    },
    example: %{
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
  })
end
