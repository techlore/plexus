defmodule Plexus.ApplicationRatings do
  alias Plexus.Repo
  alias Plexus.Schemas.ApplicationRating

  @doc """
  Creates an application_rating.
  """
  @spec create!(map()) :: ApplicationRating.t()
  def create!(attrs \\ %{}) do
    %ApplicationRating{}
    |> ApplicationRating.changeset(attrs)
    |> Repo.insert!()
  end

  @doc """
  Creates an application_rating.
  """
  @spec create(map()) :: {:ok, ApplicationRating.t()} | {:error, Ecto.Changeset.t()}
  def create(attrs \\ %{}) do
    %ApplicationRating{}
    |> ApplicationRating.changeset(attrs)
    |> Repo.insert()
  end
end
