defmodule Plexus.Apps.App do
  use Plexus.Schema

  @primary_key false
  @derive {Phoenix.Param, key: :package}
  schema "apps" do
    field :package, :string, primary_key: true
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(app, attrs) do
    app
    |> cast(attrs, [:package, :name])
    |> validate_required([:package, :name])
    |> unique_constraint(:name)
    |> unique_constraint(:package, name: :apps_pkey)
  end
end
