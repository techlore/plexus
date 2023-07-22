defmodule Plexus.Schemas.App do
  @moduledoc """
  A software application running on the Android platform. Because the Android
  platform is built for mobile devices, a typical Android app is designed for a
  smartphone or a tablet PC running on the Android OS.
  """
  use Plexus.Schema

  @primary_key false
  @derive {Phoenix.Param, key: :package}
  schema "apps" do
    field :package, :string, primary_key: true
    field :name, :string
    field :icon_url, :string
    field :scores, {:array, :map}, virtual: true

    timestamps()
  end

  @spec changeset(App.t(), map()) :: Ecto.Changeset.t()
  def changeset(%App{} = app, params) do
    app
    |> cast(params, [:package, :name, :icon_url])
    |> validate_required([:package, :name])
    |> unique_constraint(:name)
    |> unique_constraint(:package, name: :apps_pkey)
  end
end
