defmodule PlexusWeb.API.V1.AppJSON do
  use PlexusWeb, :json

  alias Plexus.Schemas.App
  alias Plexus.Schemas.Score

  def index(%{page: page}) do
    %{
      data: for(app <- page.entries, do: data(app)),
      meta: meta(page)
    }
  end

  def show(%{app: app}) do
    %{data: data(app)}
  end

  defp data(%App{} = app) do
    %{
      package: app.package,
      name: app.name,
      icon_url: app.icon_url
    }
    |> merge_scores(app.scores)
  end

  defp data(%Score{} = score) do
    %{
      google_lib: score.google_lib,
      numerator: score.numerator,
      denominator: score.denominator,
      total_count: score.total_count
    }
  end

  defp merge_scores(payload, scores) when is_list(scores) do
    scores
    |> Enum.reverse()
    |> Enum.reduce(payload, fn score, acc ->
      score_data = data(score)
      Map.update(acc, :scores, [score_data], &[score_data | &1])
    end)
  end

  defp merge_scores(payload, _scores), do: payload
end
