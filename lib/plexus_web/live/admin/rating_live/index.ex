defmodule PlexusWeb.Admin.RatingLive.Index do
  use PlexusWeb, :live_view

  alias Plexus.Apps
  alias Plexus.Ratings

  @impl Phoenix.LiveView
  def mount(%{"package" => package, "google_lib" => google_lib}, _session, socket) do
    if connected?(socket), do: Apps.subscribe(package)

    page =
      Ratings.list_ratings(package,
        google_lib: google_lib,
        page_size: 9999,
        order_by: [desc: :app_build_number, desc: :updated_at]
      )

    {:ok,
     socket
     |> assign(:google_lib, google_lib)
     |> assign(:app, Apps.get_app!(package, scores: true))
     |> stream(:ratings, page.entries)}
  end

  @impl Phoenix.LiveView
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "#{socket.assigns.app.name} Ratings")
  end

  @impl Phoenix.LiveView
  def handle_info({:app_updated, app}, socket) do
    {:noreply,
     socket
     |> put_flash(:info, "'#{app.name}' Updated")
     |> assign(:app, Apps.get_app!(app.package, scores: true))}
  end

  def handle_info({:app_deleted, _app}, socket) do
    {:noreply, push_navigate(socket, to: ~p"/admin/apps")}
  end

  def handle_info({:rating_deleted, rating}, socket) do
    {:noreply,
     socket
     |> put_flash(:info, "Rating Deleted")
     |> assign(:app, Apps.get_app!(socket.assigns.app.package, scores: true))
     |> stream_delete(:ratings, rating)}
  end

  def handle_info({:app_rating_updated, rating}, socket) do
    if rating.google_lib == String.to_existing_atom(socket.assigns.google_lib) do
      {:noreply,
       socket
       |> put_flash(:info, "Rating Added")
       |> assign(:app, Apps.get_app!(rating.app_package, scores: true))
       |> stream_insert(:ratings, rating)}
    else
      {:noreply, socket}
    end
  end

  @impl Phoenix.LiveView
  def handle_event("delete", %{"id" => id}, socket) do
    {:ok, rating} =
      id
      |> Ratings.get_rating!()
      |> Ratings.delete_rating()

    {:noreply, stream_delete(socket, :ratings, rating)}
  end
end
