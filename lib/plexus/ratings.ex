defmodule Plexus.Ratings do
  @moduledoc """
  The Ratings context.
  """
  import Ecto.Query

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

  @spec create_rating(%{
          optional(:notes) => String.t(),
          android_version: String.t(),
          app_package: String.t(),
          app_version: String.t(),
          app_build_number: non_neg_integer(),
          rom_name: String.t(),
          rom_build: String.t(),
          google_lib: atom(),
          score: pos_integer()
        }) :: {:ok, Rating.t()} | {:error, Ecto.Changeset.t()}
  def create_rating(params) do
    %Rating{}
    |> Rating.changeset(params)
    |> Repo.insert()
  end
end
