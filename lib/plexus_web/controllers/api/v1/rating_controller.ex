defmodule PlexusWeb.API.V1.RatingController do
  use PlexusWeb, :controller

  alias Plexus.ApplicationRatings
  alias Plexus.Schemas.ApplicationRating

  action_fallback PlexusWeb.FallbackController

  def index(conn, %{"application_id" => application_id} = params) do
    opts = [page: Map.get(params, "page", 1)]
    page = ApplicationRatings.list_application_ratings(application_id, opts)
    render(conn, "index.json", page: page)
  end

  def create(conn, %{"application_id" => application_id, "rating" => params}) do
    params = Map.put(params, "application_id", application_id)

    with {:ok, %ApplicationRating{} = rating} <-
           ApplicationRatings.create_application_rating(params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", show_path(rating))
      |> render("show.json", rating: rating)
    end
  end

  def show(conn, %{"id" => id}) do
    rating = ApplicationRatings.get_application_rating!(id)
    render(conn, "show.json", rating: rating)
  end

  defp show_path(rating) do
    Routes.v1_rating_path(PlexusWeb.Endpoint, :show, rating.application_id, rating)
  end
end
