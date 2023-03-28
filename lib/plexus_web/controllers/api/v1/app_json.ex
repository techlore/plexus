defmodule PlexusWeb.API.V1.AppJSON do
  use PlexusWeb, :json

  alias Plexus.Schemas.App

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
      name: app.name
    }
  end
end
