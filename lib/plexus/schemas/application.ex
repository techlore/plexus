defmodule Plexus.Schemas.Application do
  use Plexus.Schema

  @primary_key false
  @derive {Phoenix.Param, key: :package}
  schema "applications" do
    field :package, :string, primary_key: true
    field :name, :string
    field :score, :integer, virtual: true
    field :micro_g_score, :integer, virtual: true
    has_many :ratings, Schemas.Rating, references: :package

    timestamps()
  end

  @required [:name, :package]
  @optional []
  def changeset(application, attrs) do
    application
    |> cast(attrs, @required ++ @optional)
    |> validate_required(@required)
    |> unique_constraint(:package, name: :applications_pkey)
    |> unique_constraint(:name)
    |> cast_assoc(:ratings)
  end
end
