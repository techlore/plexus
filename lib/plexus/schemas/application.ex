defmodule Plexus.Schemas.Application do
  use Plexus.Schema

  schema "applications" do
    field :name, :string
    field :package, :string
    field :rating, :float, virtual: true

    timestamps()
  end

  @required [:name]
  @optional [:package]
  def changeset(application, attrs) do
    application
    |> cast(attrs, @required ++ @optional)
    |> validate_required(@required)
  end
end
