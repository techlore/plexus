defmodule Plexus.Ratings do
  import Ecto.Query

  alias Plexus.Repo
  alias Plexus.Schemas.Rating

  @spec fetch_rating!(Ecto.UUID.t()) :: Rating.t()
  def fetch_rating!(id) do
    Repo.get!(Rating, id)
  end

  @spec list_ratings(String.t(), keyword()) :: Repo.page(Rating.t())
  def list_ratings(application_package, opts \\ []) do
    opts = Keyword.take(opts, [:page])

    Rating
    |> where([r], r.application_package == ^application_package)
    |> order_by(desc: :application_build_number)
    |> Repo.paginate(opts)
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
