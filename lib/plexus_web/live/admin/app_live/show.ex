defmodule PlexusWeb.Admin.AppLive.Show do
  use PlexusWeb, :live_view

  alias Plexus.Apps

  @impl Phoenix.LiveView
  def mount(%{"package" => package}, _session, socket) do
    if connected?(socket), do: Apps.subscribe(package)
    {:ok, socket}
  end

  @impl Phoenix.LiveView
  def handle_params(%{"package" => package}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:app, Apps.get_app!(package, scores: true))}
  end

  @impl Phoenix.LiveView
  def handle_info({:app_updated, app}, socket) do
    app = Apps.get_app!(app.package, scores: true)

    {:noreply,
     socket
     |> put_flash(:info, "'#{app.name}' Updated")
     |> assign(:app, app)}
  end

  def handle_info({:app_rating_updated, rating}, socket) do
    app = Apps.get_app!(rating.app_package, scores: true)

    {:noreply,
     socket
     |> put_flash(:info, "'#{app.name}' Rating Updated")
     |> assign(:app, app)}
  end

  def handle_info({:app_deleted, _app}, socket) do
    {:noreply, push_navigate(socket, to: ~p"/admin/apps")}
  end

  defp score(assigns) do
    assigns =
      assign(
        assigns,
        :score,
        Enum.find(assigns.app.scores, &(&1.google_lib == assigns.google_lib))
      )

    ~H"""
    <%= @score.numerator %>/<%= @score.denominator %> (<%= @score.total_count %> ratings)
    """
  end

  defp page_title(:show), do: "Show App"
  defp page_title(:edit), do: "Edit App"
end
