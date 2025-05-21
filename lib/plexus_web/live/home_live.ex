defmodule PlexusWeb.HomeLive do
  use PlexusWeb, :live_view

  alias Plexus.Apps
  alias Plexus.Ratings

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, "Crowdsourced de-Googled Android apps status ratings")
     |> assign(:metrics, metrics())}
  end

  defp metrics do
    one_week_ago = DateTime.add(DateTime.utc_now(), -7, :day)

    %{
      apps_available: Apps.apps_available_count(),
      new_apps: Apps.apps_count_since(one_week_ago),
      ratings_submitted: Ratings.ratings_submitted_count(),
      new_ratings: Ratings.ratings_count_since(one_week_ago),
      gold_de_googled: Ratings.gold_de_googled_count(),
      gold_micro_g: Ratings.gold_micro_g_count(),
      silver_de_googled: Ratings.silver_de_googled_count(),
      silver_micro_g: Ratings.silver_micro_g_count(),
      bronze_de_googled: Ratings.bronze_de_googled_count(),
      bronze_micro_g: Ratings.bronze_micro_g_count(),
      broken_de_googled: Ratings.broken_de_googled_count(),
      broken_micro_g: Ratings.broken_micro_g_count()
    }
  end
end
