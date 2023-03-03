defmodule Plexus.Ratings do
  @moduledoc """
  The Ratings context.
  """
  import Ecto.Query, warn: false

  alias Plexus.QueryHelpers
  alias Plexus.Ratings.Rating
  alias Plexus.Repo

  def list_ratings(opts \\ []) do
    Rating
    |> QueryHelpers.merge_opts(opts)
    |> Repo.paginate()
  end

  def get_rating!(id, opts \\ []) do
    Rating
    |> where([r], r.id == ^id)
    |> QueryHelpers.merge_opts(opts)
    |> Repo.one!()
  end

  def create_rating(attrs \\ %{}) do
    %Rating{}
    |> Rating.changeset(attrs)
    |> Repo.insert()
  end

  def update_rating(%Rating{} = rating, attrs) do
    rating
    |> Rating.changeset(attrs)
    |> Repo.update()
  end

  def delete_rating(%Rating{} = rating) do
    Repo.delete(rating)
  end

  def change_rating(%Rating{} = rating, attrs \\ %{}) do
    Rating.changeset(rating, attrs)
  end

  def preload_app(%Rating{} = rating) do
    Repo.preload(rating, :app)
  end
end
