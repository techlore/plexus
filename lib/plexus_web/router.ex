defmodule PlexusWeb.Router do
  use PlexusWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {PlexusWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PlexusWeb do
    pipe_through :browser

    get "/", PageController, :home
  end

  scope "/api/v1", PlexusWeb.API.V1 do
    pipe_through :api

    get "/apps", AppController, :index
    get "/apps/:package", AppController, :show
    post "/apps", AppController, :create

    get "/ratings", RatingController, :index
    get "/ratings/:id", RatingController, :show
    post "/ratings", RatingController, :create
    patch "/ratings/:id", RatingController, :update
    put "/ratings/:id", RatingController, :update
  end

  # Enable LiveDashboard in development
  if Application.compile_env(:plexus, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: PlexusWeb.Telemetry
    end
  end
end
