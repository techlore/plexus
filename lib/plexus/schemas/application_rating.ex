defmodule Plexus.Schemas.ApplicationRating do
  use Plexus.Schema

  schema "application_ratings" do
    field :application_version, :string
    field :application_build_number, :integer
    field :status, Ecto.Enum, values: Enums.ApplicationRatingStatus.values()
    field :google_lib, Ecto.Enum, values: Enums.GoogleLib.values()
    field :rating, :integer
    field :notes, :string
    belongs_to :application, Schemas.Application

    timestamps()
  end

  @required [
    :application_id,
    :application_version,
    :application_build_number,
    :rating,
    :status,
    :google_lib
  ]
  @optional [:notes]
  @doc false
  def changeset(application_rating, attrs) do
    application_rating
    |> cast(attrs, @required ++ @optional)
    |> validate_required(@required)
    |> assoc_constraint(:application)
    |> validate_inclusion(:status, Enums.ApplicationRatingStatus.values())
    |> validate_inclusion(:google_lib, Enums.GoogleLib.values())
    |> validate_number(:rating, greater_than_or_equal_to: 1, less_than_or_equal_to: 4)
  end
end
