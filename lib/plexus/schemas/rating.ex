defmodule Plexus.Schemas.Rating do
  @moduledoc """
  A classification or ranking of an App based on a comparative assessment of
  their quality, standard, or performance.
  """
  use Plexus.Schema

  schema "ratings" do
    field :app_build_number, :integer
    field :app_version, :string
    field :android_version, :string
    field :rom_name, :string
    field :rom_build, :string
    field :google_lib, Ecto.Enum, values: [:none, :micro_g]
    field :notes, :string
    field :score, :integer

    belongs_to :app, Plexus.Schemas.App,
      type: :string,
      references: :package,
      foreign_key: :app_package

    timestamps()
  end

  @required [
    :android_version,
    :app_package,
    :app_version,
    :app_build_number,
    :rom_name,
    :rom_build,
    :google_lib,
    :score
  ]
  @optional [:notes]
  @doc false
  def changeset(%Rating{} = rating, attrs) do
    rating
    |> cast(attrs, @required ++ @optional)
    |> validate_required(@required)
    |> assoc_constraint(:app)
    |> validate_number(:score, greater_than_or_equal_to: 1, less_than_or_equal_to: 4)
  end
end
