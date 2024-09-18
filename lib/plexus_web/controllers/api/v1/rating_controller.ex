defmodule PlexusWeb.API.V1.RatingController do
  use PlexusWeb, :controller
  use OpenApiSpex.ControllerSpecs

  alias Plexus.Ratings
  alias PlexusWeb.API.V1.Schemas.RatingResponse
  alias PlexusWeb.API.V1.Schemas.RatingsResponse
  alias PlexusWeb.Params

  action_fallback PlexusWeb.FallbackController

  tags ["ratings"]

  operation :index,
    summary: "List Application Ratings",
    parameters: [
      package: [
        in: :path,
        description: "App Package",
        type: :string,
        required: true,
        example: "org.thoughtcrime.securesms"
      ],
      page: [in: :query, description: "Page number", type: :integer, example: 1],
      limit: [in: :query, description: "Max results per page", type: :integer, example: 5]
    ],
    responses: [
      ok: {"Ratings", "application/json", RatingsResponse}
    ]

  def index(conn, %{"package" => app_package} = params) do
    opts =
      [order_by: [desc: :app_build_number, desc: :updated_at]]
      |> Keyword.merge(build_opts(params))

    page = Ratings.list_ratings(app_package, opts)
    render(conn, :index, page: page)
  end

  operation :create, false

  def create(conn, %{"package" => app_package, "rating" => params}) do
    schema = %{
      android_version: {:string, [required: true]},
      app_package: {:string, [required: true]},
      app_version: {:string, [required: false]},
      app_build_number: {:integer, [required: true]},
      rom_name: {:string, [required: true]},
      rom_build: {:string, [required: true]},
      installation_source: {:string, [required: true]},
      rating_type: {rating_type_enum(), [required: true]},
      notes: {:string, []},
      score: {:integer, [required: true]}
    }

    params = Map.put(params, "app_package", app_package)

    with {:ok, params} <- Params.normalize(params, schema),
         {:ok, rating} <- Ratings.create_rating(params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/v1/apps/#{app_package}/ratings/#{rating}")
      |> render(:show, rating: rating)
    end
  end

  operation :show,
    summary: "Get Application Rating",
    parameters: [
      package: [
        in: :path,
        description: "App Package",
        type: :string,
        required: true,
        example: "org.thoughtcrime.securesms"
      ],
      id: [
        in: :path,
        description: "Rating Unique Identifier",
        type: :string,
        required: true,
        example: "72f5d88e-a467-4729-998f-db1edcfad6bc"
      ]
    ],
    responses: [
      ok: {"Rating", "application/json", RatingResponse}
    ]

  def show(conn, %{"id" => id}) do
    rating = Ratings.get_rating!(id)
    render(conn, :show, rating: rating)
  end

  defp rating_type_enum do
    values = Ecto.Enum.values(Plexus.Schemas.Rating, :rating_type)
    {:parameterized, Ecto.Enum, Ecto.Enum.init(values: values)}
  end

  defp build_opts(params) do
    Enum.reduce(params, [], fn
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
