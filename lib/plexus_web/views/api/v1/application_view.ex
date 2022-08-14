defmodule PlexusWeb.API.V1.ApplicationView do
  use PlexusWeb, :view

  alias PlexusWeb.API.V1.ApplicationView

  def render("index.json", %{applications: applications}) do
    data = render_many(applications, ApplicationView, "application.json")
    %{data: data}
  end

  def render("show.json", %{application: application}) do
    data = render_one(application, ApplicationView, "application.json")
    %{data: data}
  end

  def render("application.json", %{application: application}) do
    %{
      id: application.id,
      name: application.name,
      package: application.package
    }
  end
end
