defmodule PlexusWeb.API.V1.AppController do
  use PlexusWeb, :controller

  alias Plexus.Apps
  alias PlexusWeb.Params

  action_fallback PlexusWeb.FallbackController

  def index(conn, params) do
    opts = build_opts(params)
    page = Apps.list_apps(opts)
    render(conn, :index, page: page)
  end

  def create(conn, %{"app" => params}) do
    schema = %{
      package: {:string, required: true},
      name: {:string, required: true},
      icon_url: {:string, []}
    }

    with {:ok, params} <- Params.normalize(params, schema),
         {:ok, app} <- Apps.create_app(params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/v1/apps/#{app}")
      |> render(:show, app: app)
    end
  end

  def show(conn, %{"package" => package} = params) do
    opts = build_opts(params)
    app = Apps.get_app!(package, opts)
    render(conn, :show, app: app)
  end

  defp build_opts(params) do
    Enum.reduce(params, [], fn
      {"scores", "true"}, acc ->
        Keyword.put(acc, :scores, true)

      {"page", page}, acc ->
        case Integer.parse(page) do
          {value, _remainder} ->
            Keyword.put(acc, :page, value)

          :error ->
            acc
        end

      _other, acc ->
        acc
    end)
  end
end
