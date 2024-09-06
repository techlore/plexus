defmodule PlexusWeb.API.V1.Schemas.AppResponse do
  alias PlexusWeb.API.V1.Schemas.App
  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "AppResponse",
    description: "Response schema for an application",
    type: :object,
    properties: %{
      data: App
    },
    example: %{
      "data" => [
        %{
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
              "numerator" => 3.9,
              "total_count" => 44,
              "denominator" => 4
            }
          },
          "icon_url" =>
            "https://play-lh.googleusercontent.com/lMoItBgdPPVDJsNOVtP26EKHePkwBg-PkuY9NOrc-fumRtTFP4XhpUNk_22syN4Datc"
        }
      ]
    }
  })
end
