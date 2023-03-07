defmodule PlexusWeb.API.V1.RatingJSON do
  use PlexusWeb, :json

  alias Plexus.Schemas.Rating

  @doc """
  Renders a list of ratings.
  """
  def index(%{page: page}) do
    %{
      data: for(rating <- page.entries, do: data(rating)),
      meta: meta(page)
    }
  end

  @doc """
  Renders a single rating.
  """
  def show(%{rating: rating}) do
    %{data: data(rating)}
  end

  defp data(%Rating{} = rating) do
    %{
      id: rating.id,
      app_name: rating.app.name,
      app_package: rating.app_package,
      app_version: rating.app_version,
      app_build_number: rating.app_build_number,
      score: %{numerator: rating.score, denominator: 4},
      notes: rating.notes,
      google_lib: rating.google_lib
    }
  end
end
