defmodule PlexusWeb.Router do
  use PlexusWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {PlexusWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :authenticated_device do
    plug PlexusWeb.APIAuthPlug
  end

  scope "/", PlexusWeb do
    pipe_through :browser

    get "/", PageController, :home
  end

  scope "/admin", PlexusWeb.Admin do
    pipe_through :browser

    live "/apps", AppLive.Index, :index
    live "/apps/new", AppLive.Index, :new
    live "/apps/:package/edit", AppLive.Index, :edit

    live "/apps/:package", AppLive.Show, :show
    live "/apps/:package/show/edit", AppLive.Show, :edit

    live "/apps/:package/ratings/:rating_type", RatingLive.Index, :index
  end

  scope "/api/v1", PlexusWeb.API.V1 do
    pipe_through :api

    scope "/" do
      pipe_through :authenticated_device

      post "/apps", AppController, :create
      post "/apps/:package/ratings", RatingController, :create
    end

    get "/apps", AppController, :index
    get "/apps/:package", AppController, :show

    get "/apps/:package/ratings", RatingController, :index
    get "/apps/:package/ratings/:id", RatingController, :show

    post "/devices/register", DeviceController, :register
    post "/devices/verify", DeviceController, :verify
    post "/devices/renew", DeviceController, :renew
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
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
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
