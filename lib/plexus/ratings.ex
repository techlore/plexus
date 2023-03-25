defmodule Plexus.Ratings do
  @moduledoc """
  The Ratings context.
  """
  import Ecto.Changeset
  import Ecto.Query

  alias Plexus.QueryHelpers
  alias Plexus.Repo
  alias Plexus.Schemas.Rating

  @spec list_ratings(String.t(), Keyword.t()) :: Repo.page(Rating.t())
  def list_ratings(app_package, opts \\ []) do
    Rating
    |> where([r], r.app_package == ^app_package)
    |> QueryHelpers.merge_opts(opts)
    |> Repo.paginate()
  end

  @spec get_rating!(Ecto.UUID.t(), Keyword.t()) :: Rating.t()
  def get_rating!(id, opts \\ []) do
    Rating
    |> where([r], r.id == ^id)
    |> QueryHelpers.merge_opts(opts)
    |> Repo.one!()
  end

  @spec create_rating(%{
          app_package: String.t(),
          app_version: String.t(),
          app_build_number: non_neg_integer(),
          google_lib: atom(),
          score: pos_integer(),
          notes: String.t()
        }) :: {:ok, Rating.t()} | {:error, Ecto.Changeset.t()}
  def create_rating(params) do
    %Rating{}
    |> cast(params, [:app_package, :app_version, :app_build_number, :google_lib, :score, :notes])
    |> validate_required([:app_package, :app_version, :app_build_number, :google_lib, :score])
    |> assoc_constraint(:app)
    |> validate_number(:score, greater_than_or_equal_to: 1, less_than_or_equal_to: 4)
    |> Repo.insert()
  end
end
