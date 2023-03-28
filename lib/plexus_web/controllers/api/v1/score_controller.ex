defmodule PlexusWeb.API.V1.ScoreController do
  use PlexusWeb, :controller

  alias Plexus.Apps

  action_fallback PlexusWeb.FallbackController

  def index(conn, %{"package" => package}) do
    app = Apps.get_app!(package)
    scores = Apps.get_scores(app)
    render(conn, :index, scores: scores)
  end

  def show(conn, %{"package" => package, "google_lib" => google_lib}) do
    app = Apps.get_app!(package)
    score = Apps.get_score(app, google_lib)
    render(conn, :show, score: score)
  end
end
