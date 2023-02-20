defmodule Plexus.Schemas.Rating do
  use Plexus.Schema

  schema "ratings" do
    field :application_version, :string
    field :application_build_number, :integer
    field :status, Ecto.Enum, values: Enums.RatingStatus.values()
    field :google_lib, Ecto.Enum, values: Enums.GoogleLib.values()
    field :score, :integer
    field :notes, :string
    belongs_to :application, Schemas.Application

    timestamps()
  end

  @required [
    :application_id,
    :application_version,
    :application_build_number,
    :score,
    :status,
    :google_lib
  ]
  @optional [:notes]
  def changeset(application_rating, attrs) do
    application_rating
    |> cast(attrs, @required ++ @optional)
    |> validate_required(@required)
    |> assoc_constraint(:application)
    |> validate_number(:score, greater_than_or_equal_to: 1, less_than_or_equal_to: 4)
  end
end
