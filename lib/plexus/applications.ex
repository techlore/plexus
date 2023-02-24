defmodule Plexus.Applications do
  import Ecto.Query

  alias Plexus.Repo
  alias Plexus.Schemas.Application
  alias Plexus.Schemas.Rating

  @spec fetch_application!(String.t()) :: Application.t()
  def fetch_application!(package) do
    ratings = ratings_query()
    micro_g_ratings = micro_g_ratings_query()

    query =
      from a in Application,
        where: a.package == ^package,
        left_join: r in ^ratings,
        on: r.application_package == a.package,
        left_join: mgr in ^micro_g_ratings,
        on: mgr.application_package == a.package,
        group_by: [a.package],
        select_merge: %{
          score: fragment("floor(?)::integer", avg(r.score)),
          micro_g_score: fragment("floor(?)::integer", avg(mgr.score))
        }

    Repo.one!(query)
  end

  @spec list_applications(keyword()) :: Repo.page(Application.t())
  def list_applications(opts \\ []) do
    opts = Keyword.take(opts, [:page])
    ratings = ratings_query()
    micro_g_ratings = micro_g_ratings_query()

    query =
      from a in Application,
        left_join: r in ^ratings,
        on: r.application_package == a.package,
        left_join: mgr in ^micro_g_ratings,
        on: mgr.application_package == a.package,
        order_by: [a.name],
        group_by: [a.package],
        select_merge: %{
          score: fragment("floor(?)::integer", avg(r.score)),
          micro_g_score: fragment("floor(?)::integer", avg(mgr.score))
        }

    Repo.paginate(query, opts)
  end

  defp ratings_query do
    from ar in Rating, where: [google_lib: :none]
  end

  defp micro_g_ratings_query do
    from ar in Rating, where: [google_lib: :micro_g]
  end

  @spec create_application(map()) :: {:ok, Application.t()} | {:error, Ecto.Changeset.t()}
  def create_application(attrs \\ %{}) do
    %Application{}
    |> Application.changeset(attrs)
    |> Repo.insert()
  end

  @spec upsert_application!(map()) :: Application.t()
  def upsert_application!(%{package: package} = attrs) do
    application =
      with nil <- Repo.get(Application, package) do
        %Application{package: package}
      end

    application
    |> Application.changeset(attrs)
    |> Repo.insert_or_update!()
  end
end
