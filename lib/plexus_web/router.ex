defmodule PlexusWeb.Router do
  use PlexusWeb, :router

  import Phoenix.LiveDashboard.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {PlexusWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PlexusWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/", PlexusWeb do
    # TODO: Lock me down behind auth when implemented
    pipe_through [:browser]

    live_dashboard "/dev/dashboard", metrics: PlexusWeb.Telemetry
  end

  scope "/api", PlexusWeb.API do
    pipe_through :api

    scope "/v1", V1, as: :v1 do
      resources "/applications", ApplicationController,
        param: "package",
        only: [:index, :create, :show]

      resources "/applications/:package/ratings", RatingController, only: [:index, :create, :show]
    end
  end
end
