defmodule PlexusWeb.API.V1.ScoreJSON do
  use PlexusWeb, :json

  alias Plexus.Schemas.Score

  def index(%{scores: scores}) do
    %{data: for(score <- scores, do: data(score))}
  end

  def show(%{score: score}) do
    %{data: data(score)}
  end

  defp data(%Score{} = score) do
    %{
      app_package: score.app_package,
      google_lib: score.google_lib,
      numerator: score.numerator,
      denominator: score.denominator,
      total_count: score.total_count
    }
  end
end
