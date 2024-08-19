defmodule PlexusWeb.Admin.AppLive.Index do
  use PlexusWeb, :live_view

  alias Plexus.Apps
  alias Plexus.Schemas.App

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    if connected?(socket), do: Apps.subscribe()

    {:ok,
     socket
     |> assign(:page, 1)
     |> assign(:form, to_form(changeset(), as: :form))
     |> assign(:no_results?, false)
     |> assign(:end_of_timeline?, false)
     |> stream_configure(:apps, dom_id: &"apps-#{&1.package}")}
  end

  defp changeset(params \\ %{}) do
    types = %{search: :string}
    data = %{}
    Ecto.Changeset.cast({data, types}, params, Map.keys(types))
  end

  defp paginate_apps(socket, new_page) when new_page >= 1 do
    %Scrivener.Page{
      total_entries: total_entries,
      total_pages: total_pages,
      entries: apps
    } =
      Apps.list_apps(
        search_term: socket.assigns.search_term,
        page: new_page,
        scores: true,
        order_by: :name,
        page_size: 50
      )

    case {apps, new_page} do
      {[], page} when page != 1 ->
        assign(socket, end_of_timeline?: total_pages == new_page)

      {apps, _} ->
        opts = if new_page == 1, do: [reset: true], else: []
        end_of_timeline? = new_page >= total_pages

        socket
        |> assign(end_of_timeline?: end_of_timeline?)
        |> assign(no_results?: apps == [])
        |> assign(:page, new_page)
        |> assign(:total_entries, total_entries)
        |> stream(:apps, apps, opts)
    end
  end

  @impl Phoenix.LiveView
  def handle_params(params, _url, socket) do
    {:noreply,
     socket
     |> assign(:search_term, params["q"])
     |> assign(:form, to_form(changeset(%{search: params["q"]}), as: :form))
     |> paginate_apps(1)
     |> apply_action(socket.assigns.live_action, params)}
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
  def handle_event("search", %{"form" => form}, socket) do
    params =
      form
      |> Map.get("search", "")
      |> String.trim()
      |> case do
        "" -> %{}
        "*" -> %{}
        term -> %{q: term}
      end

    {:noreply, push_patch(socket, to: ~p"/admin/apps?#{params}")}
  end

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

  def handle_event("delete", %{"package" => package}, socket) do
    app = Apps.get_app!(package)
    {:ok, _} = Apps.delete_app(app)

    {:noreply, stream_delete(socket, :apps, app)}
  end

  @impl Phoenix.LiveView
  def handle_info({:app_created, app}, socket) do
    app = Apps.get_app!(app.package, scores: true)

    {:noreply,
     socket
     |> update(:page_metadata, &%{&1 | total_entries: &1.total_entries + 1})
     |> put_flash(:info, "'#{app.name}' Created")
     |> stream_insert(:apps, app, at: 0)}
  end

  def handle_info({:app_updated, app}, socket) do
    app = Apps.get_app!(app.package, scores: true)

    {:noreply,
     socket
     |> put_flash(:info, "'#{app.name}' Updated")
     |> stream_insert(:apps, app)}
  end

  def handle_info({:app_deleted, app}, socket) do
    {:noreply,
     socket
     |> update(:page_metadata, &%{&1 | total_entries: &1.total_entries - 1})
     |> put_flash(:info, "'#{app.name}' Deleted")
     |> stream_delete(:apps, app)}
  end

  def handle_info({:app_rating_updated, rating}, socket) do
    app = Apps.get_app!(rating.app_package, scores: true)

    {:noreply,
     socket
     |> put_flash(:info, "'#{app.name}' Rating Updated")
     |> stream_insert(:apps, app)}
  end
end
