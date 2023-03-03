defmodule Plexus.Ratings.Rating do
  @moduledoc """
  A classification or ranking of an App based on a comparative assessment of
  their quality, standard, or performance.

  We use a score for the following tier levels:

    1 -> Borked
    2 -> Bronze
    3 -> Silver
    4 -> Gold
  """
  use Plexus.Schema

  schema "ratings" do
    field :app_build_number, :integer
    field :app_version, :string
    field :google_lib, Ecto.Enum, values: [:none, :micro_g]
    field :notes, :string
    field :score, :integer

    belongs_to :app, Plexus.Apps.App,
      type: :string,
      references: :package,
      foreign_key: :app_package

    timestamps()
  end

  @required [:app_package, :app_version, :app_build_number, :google_lib, :score]
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
