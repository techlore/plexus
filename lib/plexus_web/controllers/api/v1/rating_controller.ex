defmodule PlexusWeb.API.V1.RatingController do
  use PlexusWeb, :controller

  alias Plexus.Ratings
  alias Plexus.Ratings.Rating

  action_fallback PlexusWeb.FallbackController

  def index(conn, _params) do
    page = Ratings.list_ratings(preload: :app)
    render(conn, :index, page: page)
  end

  def create(conn, %{"rating" => rating_params}) do
    with {:ok, %Rating{} = rating} <- Ratings.create_rating(rating_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/v1/ratings/#{rating}")
      |> render(:show, rating: Ratings.preload_app(rating))
    end
  end

  def show(conn, %{"id" => id}) do
    rating = Ratings.get_rating!(id, preload: :app)
    render(conn, :show, rating: rating)
  end

  def update(conn, %{"id" => id, "rating" => rating_params}) do
    rating = Ratings.get_rating!(id, preload: :app)

    with {:ok, %Rating{} = rating} <- Ratings.update_rating(rating, rating_params) do
      render(conn, :show, rating: rating)
    end
  end
end
