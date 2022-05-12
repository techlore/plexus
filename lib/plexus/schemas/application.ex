defmodule Plexus.Schemas.Application do
  use Plexus.Schema

  schema "applications" do
    field :name, :string
    field :package, :string

    timestamps()
  end

  @required [:name]
  @optional [:package]
  @doc false
  def changeset(application, attrs) do
    application
    |> cast(attrs, @required ++ @optional)
    |> validate_required(@required)
    |> cast_assoc(:ratings)
  end
end
