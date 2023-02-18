defmodule PlexusWeb.Router do
  use PlexusWeb, :router

  import Phoenix.LiveDashboard.Router
  import PlexusWeb.UserAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {PlexusWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_user
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PlexusWeb do
    pipe_through :browser

    get "/", PageController, :index
    delete "/users/logout", UserSessionController, :delete
  end

  scope "/", PlexusWeb do
    pipe_through [:browser, :redirect_if_user_is_authenticated]

    get "/users/login", UserSessionController, :new
    post "/users/login", UserSessionController, :create
  end

  scope "/", PlexusWeb do
    pipe_through [:browser, :require_authenticated_user]

    live_dashboard "/dev/dashboard", metrics: PlexusWeb.Telemetry
  end

  scope "/api", PlexusWeb.API do
    pipe_through :api

    scope "/v1", V1, as: :v1 do
      resources "/applications", ApplicationController, only: [:index, :create, :show]
      resources "/applications/:application_id/ratings", RatingController, only: [:index]
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
