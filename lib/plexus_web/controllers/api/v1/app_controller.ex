defmodule PlexusWeb.API.V1.AppController do
  use PlexusWeb, :controller

  alias Plexus.Apps
  alias Plexus.Apps.App

  action_fallback PlexusWeb.FallbackController

  def index(conn, _params) do
    page = Apps.list_apps()
    render(conn, :index, page: page)
  end

  def create(conn, %{"app" => app_params}) do
    with {:ok, %App{} = app} <- Apps.create_app(app_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/v1/apps/#{app}")
      |> render(:show, app: app)
    end
  end

  def show(conn, %{"package" => package}) do
    app = Apps.get_app!(package)
    render(conn, :show, app: app)
  end
end
