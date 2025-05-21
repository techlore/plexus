defmodule PlexusWeb.AppLive.Index do
  use PlexusWeb, :live_view

  alias Plexus.Apps

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, "Crowdsourced de-Googled Android apps status ratings")
     |> assign(:page, 1)
     |> assign(:form, to_form(changeset(), as: :form))
     |> assign(:no_results?, false)
     |> assign(:end_of_timeline?, false)
     |> stream_configure(:apps, dom_id: & &1.package)}
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
     |> paginate_apps(1)}
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

    {:noreply, push_patch(socket, to: ~p"/apps?#{params}")}
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
end
