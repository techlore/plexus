defmodule Plexus.Applications do
  alias Plexus.Repo
  alias Plexus.Schemas.Application

  @doc """
  Creates an application.
  """
  @spec create!(map()) :: Application.t()
  def create!(attrs \\ %{}) do
    %Application{}
    |> Application.changeset(attrs)
    |> Repo.insert!()
  end

  @doc """
  Creates an application.
  """
  @spec create(map()) :: {:ok, Application.t()} | {:error, Ecto.Changeset.t()}
  def create(attrs \\ %{}) do
    %Application{}
    |> Application.changeset(attrs)
    |> Repo.insert()
  end
end
