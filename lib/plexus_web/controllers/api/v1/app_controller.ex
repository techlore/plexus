defmodule PlexusWeb.API.V1.AppController do
  use PlexusWeb, :controller
  use OpenApiSpex.ControllerSpecs

  alias Plexus.Apps
  alias PlexusWeb.API.V1.Schemas.AppResponse
  alias PlexusWeb.API.V1.Schemas.AppsResponse
  alias PlexusWeb.Params

  action_fallback PlexusWeb.FallbackController

  tags ["apps"]

  operation :index,
    summary: "List Applications",
    parameters: [
      page: [in: :query, description: "Page number", type: :integer, example: 1],
      limit: [in: :query, description: "Max results per page", type: :integer, example: 25],
      scores: [in: :query, description: "Include scores", type: :boolean, example: true],
      q: [in: :query, description: "Search query", type: :string, example: "Signal"],
      last_updated: [
        in: :query,
        description: "Apps that have updates after or on your datetime. Using RFC 3339",
        type: %OpenApiSpex.Schema{type: :string, format: "date-time"},
        example:
          DateTime.utc_now()
          |> DateTime.add(-7, :day)
          |> DateTime.truncate(:second)
          |> DateTime.to_iso8601(:extended)
      ]
    ],
    responses: [
      ok: {"Applications", "application/json", AppsResponse}
    ]

  def index(conn, params) do
    opts = build_opts(params)
    page = Apps.list_apps(opts)
    render(conn, :index, page: page)
  end

  operation :create, false

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

  operation :show,
    summary: "Get Application",
    parameters: [
      package: [
        in: :path,
        description: "App Package",
        type: :string,
        required: true,
        example: "org.thoughtcrime.securesms"
      ],
      scores: [in: :query, description: "Include scores", type: :boolean, example: true]
    ],
    responses: [
      ok: {"Application", "application/json", AppResponse}
    ]

  def show(conn, %{"package" => package} = params) do
    opts = build_opts(params)
    app = Apps.get_app!(package, opts)
    render(conn, :show, app: app)
  end

  defp build_opts(params) do
    Enum.reduce(params, [], fn
      {"q", search_term}, acc ->
        Keyword.put(acc, :search_term, search_term)

      {"scores", "true"}, acc ->
        Keyword.put(acc, :scores, true)

      {"last_updated", last_updated}, acc ->
        case DateTime.from_iso8601(last_updated) do
          {:ok, last_updated_dt, _utc_offset} ->
            Keyword.put(acc, :updated_at_greater_than_or_equal_to, last_updated_dt)

          _ ->
            acc
        end

      {"page", page}, acc ->
        case Integer.parse(page) do
          {value, _remainder} ->
            Keyword.put(acc, :page, value)

          :error ->
            acc
        end

      {"limit", limit}, acc ->
        case Integer.parse(limit) do
          {value, _remainder} ->
            Keyword.put(acc, :limit, value)

          :error ->
            acc
        end

      _other, acc ->
        acc
    end)
  end
end
