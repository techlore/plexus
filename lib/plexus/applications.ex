defmodule Plexus.Applications do
  import Ecto.Query

  alias Plexus.Repo
  alias Plexus.Schemas.Application
  alias Plexus.Schemas.Rating

  @spec get_application!(Ecto.UUID.t()) :: Application.t()
  def get_application!(id) do
    ratings = approved_ratings()
    micro_g_ratings = approved_micro_g_ratings()

    query =
      from a in Application,
        where: a.id == ^id,
        left_join: r in ^ratings,
        on: r.application_id == a.id,
        left_join: mgr in ^micro_g_ratings,
        on: mgr.application_id == a.id,
        group_by: [a.id],
        select_merge: %{
          rating: fragment("floor(?)::integer", avg(r.score)),
          micro_g_rating: fragment("floor(?)::integer", avg(mgr.score))
        }

    Repo.one!(query)
  end

  @spec list_applications(keyword()) :: Repo.page(Application.t())
  def list_applications(opts \\ []) do
    opts = Keyword.take(opts, [:page])
    ratings = approved_ratings()
    micro_g_ratings = approved_micro_g_ratings()

    query =
      from a in Application,
        left_join: r in ^ratings,
        on: r.application_id == a.id,
        left_join: mgr in ^micro_g_ratings,
        on: mgr.application_id == a.id,
        order_by: [a.name],
        group_by: [a.id],
        select_merge: %{
          rating: fragment("floor(?)::integer", avg(r.score)),
          micro_g_rating: fragment("floor(?)::integer", avg(mgr.score))
        }

    Repo.paginate(query, opts)
  end

  defp approved_ratings do
    from ar in Rating, where: [status: :approved, google_lib: :none]
  end

  defp approved_micro_g_ratings do
    from ar in Rating, where: [status: :approved, google_lib: :micro_g]
  end

  @spec create_application!(map()) :: Application.t()
  def create_application!(attrs \\ %{}) do
    %Application{}
    |> Application.changeset(attrs)
    |> Repo.insert!()
  end

  @spec create_application(map()) :: {:ok, Application.t()} | {:error, Ecto.Changeset.t()}
  def create_application(attrs \\ %{}) do
    %Application{}
    |> Application.changeset(attrs)
    |> Repo.insert()
  end

  @spec upsert_application!(map()) :: Application.t()
  def upsert_application!(%{id: application_id} = attrs) do
    application =
      with nil <- Repo.get(Application, application_id) do
        %Application{id: application_id}
      end

    application
    |> Application.changeset(attrs)
    |> Repo.insert_or_update!()
  end
end
