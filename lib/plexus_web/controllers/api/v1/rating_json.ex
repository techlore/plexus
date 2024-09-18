defmodule PlexusWeb.API.V1.RatingJSON do
  use PlexusWeb, :json

  alias Plexus.Schemas.Rating

  def index(%{page: page}) do
    %{
      data: for(rating <- page.entries, do: data(rating)),
      meta: meta(page)
    }
  end

  def show(%{rating: rating}) do
    %{data: data(rating)}
  end

  defp data(%Rating{} = rating) do
    %{
      id: rating.id,
      android_version: rating.android_version,
      app_package: rating.app_package,
      app_version: rating.app_version || "",
      app_build_number: rating.app_build_number,
      rom_name: rating.rom_name,
      rom_build: rating.rom_build,
      installation_source: rating.installation_source,
      score: %{numerator: rating.score, denominator: 4},
      notes: rating.notes,
      rating_type: rating.rating_type
    }
  end
end
