defmodule Plexus.Apps do
  @moduledoc """
  The Apps context.
  """
  import Ecto.Query, warn: false

  alias Plexus.Apps.App
  alias Plexus.Repo

  def list_apps do
    Repo.paginate(App)
  end

  def get_app!(package) do
    Repo.get!(App, package)
  end

  def create_app(attrs \\ %{}) do
    %App{}
    |> App.changeset(attrs)
    |> Repo.insert()
  end

  def update_app(%App{} = app, attrs) do
    app
    |> App.changeset(attrs)
    |> Repo.update()
  end

  def delete_app(%App{} = app) do
    Repo.delete(app)
  end

  def change_app(%App{} = app, attrs \\ %{}) do
    App.changeset(app, attrs)
  end
end
