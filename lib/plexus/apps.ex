defmodule Plexus.Apps do
  @moduledoc """
  The Apps context.
  """
  import Ecto.Changeset
  import Ecto.Query

  alias Plexus.QueryHelpers
  alias Plexus.Repo
  alias Plexus.Schemas.App

  @spec list_apps(Keyword.t()) :: Repo.page(App.t())
  def list_apps(opts \\ []) do
    App
    |> QueryHelpers.merge_opts(opts)
    |> Repo.paginate()
  end

  @spec get_app!(String.t(), Keyword.t()) :: App.t()
  def get_app!(package, opts \\ []) do
    App
    |> where([a], a.package == ^package)
    |> QueryHelpers.merge_opts(opts)
    |> Repo.one!()
  end

  @spec create_app(%{
          package: String.t(),
          name: String.t()
        }) :: {:ok, App.t()} | {:error, Ecto.Changeset.t()}
  def create_app(params) do
    %App{}
    |> change(%{package: params.package, name: params.name})
    |> validate_required([:package, :name])
    |> unique_constraint(:name)
    |> unique_constraint(:package, name: :apps_pkey)
    |> Repo.insert()
  end
end
