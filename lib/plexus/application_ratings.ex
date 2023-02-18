defmodule Plexus.ApplicationRatings do
  alias Plexus.Repo
  alias Plexus.Schemas.ApplicationRating

  import Ecto.Query

  @spec get_application_rating!(Ecto.UUID.t()) :: ApplicationRating.t()
  def get_application_rating!(id) do
    Repo.get!(ApplicationRating, id)
  end

  @spec list_application_ratings(Ecto.UUID.t(), keyword()) :: Repo.page(ApplicationRating.t())
  def list_application_ratings(application_id, opts \\ []) do
    opts = Keyword.take(opts, [:page])

    ApplicationRating
    |> where([ar], ar.application_id == ^application_id)
    |> order_by(desc: :application_build_number)
    |> Repo.paginate(opts)
  end

  @doc """
  Creates an application_rating.
  """
  @spec create_application_rating!(map()) :: ApplicationRating.t()
  def create_application_rating!(attrs \\ %{}) do
    %ApplicationRating{}
    |> ApplicationRating.changeset(attrs)
    |> Repo.insert!()
  end

  @doc """
  Creates an application_rating.
  """
  @spec create_application_rating(map()) ::
          {:ok, ApplicationRating.t()} | {:error, Ecto.Changeset.t()}
  def create_application_rating(attrs \\ %{}) do
    %ApplicationRating{}
    |> ApplicationRating.changeset(attrs)
    |> Repo.insert()
  end
end
