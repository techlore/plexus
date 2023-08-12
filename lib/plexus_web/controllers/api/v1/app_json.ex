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
      rating_type: score.rating_type,
      numerator: score.numerator,
      denominator: score.denominator,
      total_count: score.total_count
    }
  end

  defp merge_scores(payload, scores) when is_map(scores) do
    data = Map.new(scores, fn {rating_type, score} -> {rating_type, data(score)} end)
    Map.put(payload, :scores, data)
  end

  defp merge_scores(payload, _scores), do: payload
end
