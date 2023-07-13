defmodule Plexus.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl Application
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PlexusWeb.Telemetry,
      # Start the Ecto repository
      Plexus.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Plexus.PubSub},
      # Start the Endpoint (http/https)
      PlexusWeb.Endpoint,
      # Start Finch
      {Finch, name: Plexus.Finch},
      # Start a worker by calling: Plexus.Worker.start_link(arg)
      {Registry, keys: :unique, name: Registry.Device}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Plexus.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl Application
  def config_change(changed, _new, removed) do
    PlexusWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
