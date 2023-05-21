defmodule Plexus.Apps do
  @moduledoc """
  The Apps context.
  """
  import Ecto.Changeset
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
    |> cast(params, [:package, :name, :icon_url])
    |> validate_required([:package, :name])
    |> unique_constraint(:name)
    |> unique_constraint(:package, name: :apps_pkey)
    |> Repo.insert()
  end

  defp with_scores(query, opts) do
    if Keyword.get(opts, :scores, false) do
      with_scores(query)
    else
      query
    end
  end

  defp with_scores(query) do
    google_lib_micro_g = from Rating, where: [google_lib: :micro_g]
    google_lib_none = from Rating, where: [google_lib: :none]

    query
    |> join(:left, [a], r_micro_g in subquery(google_lib_micro_g),
      on: a.package == r_micro_g.app_package
    )
    |> join(:left, [a, _], r_none in subquery(google_lib_none),
      on: a.package == r_none.app_package
    )
    |> group_by([a, r_micro_g, r_none], [a.package, r_micro_g.google_lib, r_none.google_lib])
    |> select_merge([a, r_micro_g, r_none], %{
      scores: [
        %Score{
          app_package: a.package,
          google_lib: :micro_g,
          numerator:
            fragment("CAST(ROUND(AVG(COALESCE(?, 0))::numeric, 2) AS FLOAT)", r_micro_g.score),
          total_count: count(r_micro_g.id, :distinct)
        },
        %Score{
          app_package: a.package,
          google_lib: :none,
          numerator:
            fragment("CAST(ROUND(AVG(COALESCE(?, 0))::numeric, 2) AS FLOAT)", r_none.score),
          total_count: count(r_none.id, :distinct)
        }
      ]
    })
  end
end
