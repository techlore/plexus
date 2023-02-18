defmodule PlexusWeb.API.V1.RatingController do
  use PlexusWeb, :controller

  alias Plexus.ApplicationRatings

  action_fallback PlexusWeb.FallbackController

  def index(conn, %{"application_id" => application_id} = params) do
    opts = [page: Map.get(params, "page", 1)]
    page = ApplicationRatings.list_application_ratings(application_id, opts)
    render(conn, "index.json", page: page)
  end
end
