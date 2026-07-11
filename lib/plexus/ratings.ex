defmodule Plexus.Ratings do
  @moduledoc """
  The Ratings context.
  """
  import Ecto.Query

  alias Plexus.Apps
  alias Plexus.DeleteToken
  alias Plexus.PaginationHelpers
  alias Plexus.QueryHelpers
  alias Plexus.Repo
  alias Plexus.Schemas.Rating

  @doc """
  Fetches a page of Ratings.

  ## Options

    - See `Plexus.QueryHelpers.merge_opts/2`
    - See `Plexus.PaginationHelpers.page_opts/2`

  """
  @spec list_ratings(String.t(), Keyword.t()) :: Repo.page(Rating.t())
  def list_ratings(app_package, opts \\ []) do
    page_opts = PaginationHelpers.page_opts(opts)

    Rating
    |> where([r], r.app_package == ^app_package)
    |> QueryHelpers.merge_opts(opts)
    |> Repo.paginate(page_opts)
  end

  @doc """
  Fetches a Rating.

  Raises on not found.

  ## Options

    - See `Plexus.QueryHelpers.merge_opts/2`

  """
  @spec get_rating!(Ecto.UUID.t(), Keyword.t()) :: Rating.t()
  def get_rating!(id, opts \\ []) do
    Rating
    |> where([r], r.id == ^id)
    |> QueryHelpers.merge_opts(opts)
    |> Repo.one!()
  end

  @doc """
  Fetches a Rating.

  ## Options

    - See `Plexus.QueryHelpers.merge_opts/2`

  """
  @spec fetch_rating(Ecto.UUID.t(), Keyword.t()) :: {:ok, Rating.t()} | {:error, :not_found}
  def fetch_rating(id, opts \\ []) do
    Rating
    |> where([r], r.id == ^id)
    |> QueryHelpers.merge_opts(opts)
    |> Repo.one()
    |> case do
      nil -> {:error, :not_found}
      rating -> {:ok, rating}
    end
  end

  @spec create_rating(%{
          optional(:notes) => String.t(),
          android_version: String.t(),
          app_package: String.t(),
          app_version: String.t() | nil,
          app_build_number: non_neg_integer(),
          rom_name: String.t(),
          rom_build: String.t(),
          installation_source: String.t(),
          rating_type: atom(),
          score: pos_integer()
        }) :: {:ok, Rating.t(), String.t()} | {:error, :not_found} | {:error, Ecto.Changeset.t()}
  def create_rating(%{app_package: app_package} = params) do
    Repo.transact(fn ->
      with {:ok, app} <- Apps.fetch_app(app_package),
           {:ok, _app} <- Apps.update_app(app, %{updated_at: DateTime.utc_now()}),
           {delete_token, delete_token_hash} = DeleteToken.generate(),
           params = Map.put(params, :delete_token_hash, delete_token_hash),
           changeset = Rating.changeset(%Rating{}, params),
           {:ok, rating} <- Repo.insert(changeset) do
        {:ok, {rating, delete_token}}
      end
    end)
    |> broadcast(:app_rating_updated)
  end

  @doc """
  Deletes a rating.

  use `delete_rating/1` when using in the admin dashboard.
  use `delete_rating/2` in the public API to ensure ownership.
  """
  @spec delete_rating(Rating.t()) :: {:ok, Rating.t()} | {:error, Ecto.Changeset.t()}
  def delete_rating(%Rating{} = rating) do
    rating
    |> Repo.delete()
    |> broadcast(:rating_deleted)
  end

  @spec delete_rating(Rating.t(), String.t()) ::
          {:ok, Rating.t()}
          | {:error, Ecto.Changeset.t()}
          | {:error, :unauthorized}
  def delete_rating(%Rating{} = rating, delete_token) do
    if DeleteToken.valid?(rating.delete_token_hash, delete_token) do
      delete_rating(rating)
    else
      {:error, :unauthorized}
    end
  end

  @spec ratings_submitted_count :: pos_integer()
  def ratings_submitted_count do
    Repo.aggregate(Rating, :count)
  end

  @spec ratings_count_since(DateTime.t()) :: pos_integer()
  def ratings_count_since(datetime) do
    Rating
    |> where([rating], rating.inserted_at >= ^datetime)
    |> Repo.aggregate(:count)
  end

  def gold_de_googled_count do
    Rating
    |> where([rating], rating.score == 4)
    |> where([rating], rating.rating_type == :native)
    |> Repo.aggregate(:count)
  end

  def gold_micro_g_count do
    Rating
    |> where([rating], rating.score == 4)
    |> where([rating], rating.rating_type == :micro_g)
    |> Repo.aggregate(:count)
  end

  def silver_de_googled_count do
    Rating
    |> where([rating], rating.score == 3)
    |> where([rating], rating.rating_type == :native)
    |> Repo.aggregate(:count)
  end

  def silver_micro_g_count do
    Rating
    |> where([rating], rating.score == 3)
    |> where([rating], rating.rating_type == :micro_g)
    |> Repo.aggregate(:count)
  end

  def bronze_de_googled_count do
    Rating
    |> where([rating], rating.score == 2)
    |> where([rating], rating.rating_type == :native)
    |> Repo.aggregate(:count)
  end

  def bronze_micro_g_count do
    Rating
    |> where([rating], rating.score == 2)
    |> where([rating], rating.rating_type == :micro_g)
    |> Repo.aggregate(:count)
  end

  def broken_de_googled_count do
    Rating
    |> where([rating], rating.score == 1)
    |> where([rating], rating.rating_type == :native)
    |> Repo.aggregate(:count)
  end

  def broken_micro_g_count do
    Rating
    |> where([rating], rating.score == 1)
    |> where([rating], rating.rating_type == :micro_g)
    |> Repo.aggregate(:count)
  end

  defp broadcast({:error, _reason} = error, _event), do: error

  defp broadcast({:ok, {rating, delete_token}}, event) do
    Phoenix.PubSub.broadcast!(Plexus.PubSub, "apps", {event, rating})
    Phoenix.PubSub.broadcast!(Plexus.PubSub, "apps:#{rating.app_package}", {event, rating})
    {:ok, rating, delete_token}
  end

  defp broadcast({:ok, rating}, event) do
    Phoenix.PubSub.broadcast!(Plexus.PubSub, "apps", {event, rating})
    Phoenix.PubSub.broadcast!(Plexus.PubSub, "apps:#{rating.app_package}", {event, rating})
    {:ok, rating}
  end
end
