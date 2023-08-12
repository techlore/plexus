defmodule Plexus.Apps do
  @moduledoc """
  The Apps context.
  """
  import Ecto.Query

  alias Plexus.PaginationHelpers
  alias Plexus.QueryHelpers
  alias Plexus.Repo
  alias Plexus.Schemas.App
  alias Plexus.Schemas.Rating
  alias Plexus.Schemas.Score

  @doc """
  Fetches a page of Apps.

  ## Options

    - See `Plexus.QueryHelpers.merge_opts/2`
    - See `Plexus.PaginationHelpers.page_opts/2`
    - `:scores` :: boolean (default: `false`)

  """
  @spec list_apps(Keyword.t()) :: Repo.page(App.t())
  def list_apps(opts \\ []) do
    page_opts = PaginationHelpers.page_opts(opts)

    App
    |> with_scores(opts)
    |> QueryHelpers.merge_opts(opts)
    |> Repo.paginate(page_opts)
  end

  @doc """
  Fetches an App.

  ## Options

    - See `Plexus.QueryHelpers.merge_opts/2`
    - `:scores` :: boolean (default: `false`)

  """
  @spec get_app!(String.t(), Keyword.t()) :: App.t()
  def get_app!(package, opts \\ []) do
    App
    |> where([a], a.package == ^package)
    |> with_scores(opts)
    |> QueryHelpers.merge_opts(opts)
    |> Repo.one!()
  end

  @spec create_app(%{
          optional(:icon_url) => String.t(),
          package: String.t(),
          name: String.t()
        }) :: {:ok, App.t()} | {:error, Ecto.Changeset.t()}
  def create_app(params) do
    %App{}
    |> App.changeset(params)
    |> Repo.insert()
    |> broadcast(:app_created)
  end

  @spec update_app(App.t(), %{
          optional(:icon_url) => String.t(),
          name: String.t()
        }) :: {:ok, App.t()} | {:error, Ecto.Changeset.t()}
  def update_app(%App{} = app, params) do
    app
    |> App.changeset(params)
    |> Repo.update()
    |> broadcast(:app_updated)
  end

  @spec change_app(App.t(), map()) :: Ecto.Changeset.t()
  def change_app(app, params \\ %{}) do
    App.changeset(app, params)
  end

  @spec delete_app(App.t()) :: {:ok, App.t()} | {:error, Ecto.Changeset.t()}
  def delete_app(%App{} = app) do
    app
    |> Repo.delete()
    |> broadcast(:app_deleted)
  end

  defp with_scores(query, opts) do
    if Keyword.get(opts, :scores, false) do
      with_scores(query)
    else
      query
    end
  end

  defp with_scores(query) do
    micro_g = from Rating, where: [rating_type: :micro_g]
    native = from Rating, where: [rating_type: :native]

    query
    |> join(:left, [a], r_micro_g in subquery(micro_g), on: a.package == r_micro_g.app_package)
    |> join(:left, [a, _], r_native in subquery(native), on: a.package == r_native.app_package)
    |> group_by([a, r_micro_g, r_native], [a.package, r_micro_g.rating_type, r_native.rating_type])
    |> select_merge([a, r_micro_g, r_native], %{
      scores: %{
        native: %Score{
          app_package: a.package,
          rating_type: :native,
          numerator:
            fragment("CAST(ROUND(AVG(COALESCE(?, 0))::numeric, 2) AS FLOAT)", r_native.score),
          total_count: count(r_native.id, :distinct)
        },
        micro_g: %Score{
          app_package: a.package,
          rating_type: :micro_g,
          numerator:
            fragment("CAST(ROUND(AVG(COALESCE(?, 0))::numeric, 2) AS FLOAT)", r_micro_g.score),
          total_count: count(r_micro_g.id, :distinct)
        }
      }
    })
  end

  @spec subscribe :: :ok
  def subscribe do
    Phoenix.PubSub.subscribe(Plexus.PubSub, "apps")
  end

  @spec subscribe(String.t()) :: :ok
  def subscribe(package) do
    Phoenix.PubSub.subscribe(Plexus.PubSub, "apps:#{package}")
  end

  defp broadcast({:error, _reason} = error, _event), do: error

  defp broadcast({:ok, app}, event) do
    Phoenix.PubSub.broadcast!(Plexus.PubSub, "apps", {event, app})
    Phoenix.PubSub.broadcast!(Plexus.PubSub, "apps:#{app.package}", {event, app})
    {:ok, app}
  end
end
