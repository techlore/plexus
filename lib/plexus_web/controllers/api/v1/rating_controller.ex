defmodule PlexusWeb.API.V1.RatingController do
  use PlexusWeb, :controller

  alias Plexus.Ratings
  alias Plexus.Schemas.Rating

  action_fallback PlexusWeb.FallbackController

  def index(conn, %{"application_id" => application_id} = params) do
    opts = [page: Map.get(params, "page", 1)]
    page = Ratings.list_ratings(application_id, opts)
    render(conn, "index.json", page: page)
  end

  def create(conn, %{"application_id" => application_id, "rating" => params}) do
    params = Map.put(params, "application_id", application_id)

    with {:ok, %Rating{} = rating} <- Ratings.create_rating(params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", show_path(rating))
      |> render("show.json", rating: rating)
    end
  end

  def show(conn, %{"id" => id}) do
    rating = Ratings.fetch_rating!(id)
    render(conn, "show.json", rating: rating)
  end

  defp show_path(rating) do
    Routes.v1_rating_path(PlexusWeb.Endpoint, :show, rating.application_id, rating)
  end
end
