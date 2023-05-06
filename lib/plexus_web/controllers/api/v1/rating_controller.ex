defmodule PlexusWeb.API.V1.RatingController do
  use PlexusWeb, :controller

  alias Plexus.Ratings
  alias PlexusWeb.Params

  action_fallback PlexusWeb.FallbackController

  def index(conn, %{"package" => app_package} = params) do
    opts =
      [order_by: [desc: :app_build_number, desc: :updated_at]]
      |> Keyword.merge(build_opts(params))

    page = Ratings.list_ratings(app_package, opts)
    render(conn, :index, page: page)
  end

  def create(conn, %{"package" => app_package, "rating" => params}) do
    schema = %{
      app_package: {:string, [required: true]},
      app_version: {:string, [required: true]},
      app_build_number: {:integer, [required: true]},
      google_lib: {google_lib_enum(), [required: true]},
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

  def show(conn, %{"id" => id}) do
    rating = Ratings.get_rating!(id)
    render(conn, :show, rating: rating)
  end

  defp google_lib_enum do
    values = Ecto.Enum.values(Plexus.Schemas.Rating, :google_lib)
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

      _other, acc ->
        acc
    end)
  end
end
