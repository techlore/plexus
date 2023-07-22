defmodule PlexusWeb.Admin.AppLive.Index do
  use PlexusWeb, :live_view

  alias Plexus.Apps
  alias Plexus.Schemas.App

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    {entries, page_metadata} =
      [scores: true, order_by: :name, page_size: 9999]
      |> Apps.list_apps()
      |> Map.pop(:entries)

    {:ok,
     socket
     |> assign(:page_metadata, page_metadata)
     |> stream_configure(:apps, dom_id: &"apps-#{&1.package}")
     |> stream(:apps, entries)}
  end

  @impl Phoenix.LiveView
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"package" => package}) do
    socket
    |> assign(:page_title, "Edit App")
    |> assign(:app, Apps.get_app!(package, scores: true))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New App")
    |> assign(:app, %App{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Apps")
    |> assign(:app, nil)
  end

  @impl Phoenix.LiveView
  def handle_info({PlexusWeb.Admin.AppLive.FormComponent, {:saved, app}}, socket) do
    app = Apps.get_app!(app.package, scores: true)
    {:noreply, stream_insert(socket, :apps, app, at: 0)}
  end

  @impl Phoenix.LiveView
  def handle_event("delete", %{"package" => package}, socket) do
    app = Apps.get_app!(package)
    {:ok, _} = Apps.delete_app(app)

    {:noreply, stream_delete(socket, :apps, app)}
  end
end
