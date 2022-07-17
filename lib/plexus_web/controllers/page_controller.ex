defmodule PlexusWeb.PageController do
  use PlexusWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
