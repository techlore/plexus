defmodule PlexusWeb.API.V1.ApplicationController do
  use PlexusWeb, :controller

  alias Plexus.Applications
  alias Plexus.Schemas.Application

  action_fallback PlexusWeb.FallbackController

  def index(conn, _params) do
    page = Applications.list_applications()
    render(conn, "index.json", page: page)
  end

  def create(conn, %{"application" => application_params}) do
    with {:ok, %Application{} = application} <-
           Applications.create_application(application_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", show_path(application))
      |> render("show.json", application: application)
    end
  end

  def show(conn, %{"id" => id}) do
    application = Applications.get_application!(id)
    render(conn, "show.json", application: application)
  end

  defp show_path(application) do
    Routes.v1_application_path(PlexusWeb.Endpoint, :show, application)
  end
end
