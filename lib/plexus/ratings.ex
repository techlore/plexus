defmodule Plexus.Ratings do
  import Ecto.Query

  alias Plexus.Repo
  alias Plexus.Schemas.Rating

  @spec get_rating!(Ecto.UUID.t()) :: Rating.t()
  def get_rating!(id) do
    Repo.get!(Rating, id)
  end

  @spec list_ratings(Ecto.UUID.t(), keyword()) :: Repo.page(Rating.t())
  def list_ratings(application_id, opts \\ []) do
    opts = Keyword.take(opts, [:page])

    Rating
    |> where([r], r.application_id == ^application_id)
    |> order_by(desc: :application_build_number)
    |> Repo.paginate(opts)
  end

  @spec create_rating!(map()) :: Rating.t()
  def create_rating!(attrs \\ %{}) do
    %Rating{}
    |> Rating.changeset(attrs)
    |> Repo.insert!()
  end

  @spec create_rating(map()) :: {:ok, Rating.t()} | {:error, Ecto.Changeset.t()}
  def create_rating(attrs \\ %{}) do
    %Rating{}
    |> Rating.changeset(attrs)
    |> Repo.insert()
  end

  @spec upsert_rating!(map()) :: Rating.t()
  def upsert_rating!(%{id: rating_id} = attrs) do
    rating =
      with nil <- Repo.get(Rating, rating_id) do
        %Rating{id: rating_id}
      end

    rating
    |> Rating.changeset(attrs)
    |> Repo.insert_or_update!()
  end
end
