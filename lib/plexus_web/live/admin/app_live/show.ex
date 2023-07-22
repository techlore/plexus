defmodule PlexusWeb.Admin.AppLive.Show do
  use PlexusWeb, :live_view

  alias Plexus.Apps

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl Phoenix.LiveView
  def handle_params(%{"package" => package}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:app, Apps.get_app!(package, scores: true))}
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
