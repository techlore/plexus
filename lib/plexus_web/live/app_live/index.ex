defmodule PlexusWeb.AppLive.Index do
  use PlexusWeb, :live_view

  alias Plexus.Apps

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:page, 1)
     |> stream_configure(:apps, dom_id: & &1.package)
     |> paginate_apps(1)}
  end

  defp paginate_apps(socket, new_page) when new_page >= 1 do
    %Scrivener.Page{
      total_entries: total_entries,
      total_pages: total_pages,
      entries: apps
    } = Apps.list_apps(page: new_page, scores: true, order_by: :name)

    case apps do
      [] ->
        assign(socket, end_of_timeline?: total_pages == new_page)

      [_ | _] = apps ->
        socket
        |> assign(end_of_timeline?: false)
        |> assign(:page, new_page)
        |> assign(:total_entries, total_entries)
        |> stream(:apps, apps)
    end
  end

  @impl Phoenix.LiveView
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Crowdsourced de-Googled Android apps status ratings")
    |> assign(:app, nil)
  end

  @impl Phoenix.LiveView
  def handle_event("next-page", _, socket) do
    {:noreply, paginate_apps(socket, socket.assigns.page + 1)}
  end

  def handle_event("prev-page", %{"_overran" => true}, socket) do
    {:noreply, paginate_apps(socket, 1)}
  end

  def handle_event("prev-page", _, socket) do
    if socket.assigns.page > 1 do
      {:noreply, paginate_apps(socket, socket.assigns.page - 1)}
    else
      {:noreply, socket}
    end
  end
end
