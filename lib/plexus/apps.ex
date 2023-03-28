defmodule Plexus.Apps do
  @moduledoc """
  The Apps context.
  """
  import Ecto.Changeset
  import Ecto.Query

  alias Plexus.QueryHelpers
  alias Plexus.Repo
  alias Plexus.Schemas.App
  alias Plexus.Schemas.Rating
  alias Plexus.Schemas.Score

  @spec list_apps(Keyword.t()) :: Repo.page(App.t())
  def list_apps(opts \\ []) do
    App
    |> QueryHelpers.merge_opts(opts)
    |> Repo.paginate()
  end

  @spec get_app!(String.t(), Keyword.t()) :: App.t()
  def get_app!(package, opts \\ []) do
    App
    |> where([a], a.package == ^package)
    |> QueryHelpers.merge_opts(opts)
    |> Repo.one!()
  end

  @spec create_app(%{
          package: String.t(),
          name: String.t()
        }) :: {:ok, App.t()} | {:error, Ecto.Changeset.t()}
  def create_app(params) do
    %App{}
    |> cast(params, [:package, :name])
    |> validate_required([:package, :name])
    |> unique_constraint(:name)
    |> unique_constraint(:package, name: :apps_pkey)
    |> Repo.insert()
  end

  def get_scores(%App{} = app) do
    for google_lib <- Ecto.Enum.values(Rating, :google_lib) do
      get_score(app, google_lib)
    end
  end

  def get_score(%App{package: app_package}, google_lib) do
    query =
      from r in Rating,
        where: r.app_package == ^app_package and r.google_lib == ^google_lib,
        group_by: [r.app_package, r.google_lib],
        select: %{
          app_package: r.app_package,
          google_lib: r.google_lib,
          numerator: fragment("CAST(ROUND(AVG(?)::numeric, 2) AS FLOAT)", r.score),
          total_count: count(r.id)
        }

    data = Repo.one(query) || %{app_package: app_package, google_lib: google_lib}
    struct(Score, data)
  end
end
