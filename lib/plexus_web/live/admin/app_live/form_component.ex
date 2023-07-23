defmodule PlexusWeb.Admin.AppLive.FormComponent do
  use PlexusWeb, :live_component

  alias Plexus.Apps

  @impl Phoenix.LiveComponent
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
      </.header>

      <.simple_form
        for={@form}
        id="app-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input :if={@action == :new} field={@form[:package]} label="Package" />
        <.input field={@form[:name]} label="Name" />
        <.input field={@form[:icon_url]} label="Icon URL" />
        <:actions>
          <.button phx-disable-with="Saving...">Save App</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl Phoenix.LiveComponent
  def update(%{app: app} = assigns, socket) do
    changeset = Apps.change_app(app)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl Phoenix.LiveComponent
  def handle_event("validate", %{"app" => app_params}, socket) do
    changeset =
      socket.assigns.app
      |> Apps.change_app(app_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"app" => app_params}, socket) do
    save_app(socket, socket.assigns.action, app_params)
  end

  defp save_app(socket, :edit, app_params) do
    case Apps.update_app(socket.assigns.app, app_params) do
      {:ok, _app} ->
        {:noreply, push_patch(socket, to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_app(socket, :new, app_params) do
    case Apps.create_app(app_params) do
      {:ok, _app} ->
        {:noreply, push_patch(socket, to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end
end
