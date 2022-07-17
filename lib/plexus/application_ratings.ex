defmodule Plexus.ApplicationRatings do
  alias Plexus.Repo
  alias Plexus.Schemas.ApplicationRating

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
