defmodule Plexus.Schemas.Score do
  use Plexus.Schema

  @primary_key false
  embedded_schema do
    field :app_package, :string
    field :google_lib, Ecto.Enum, values: [:none, :micro_g]
    field :numerator, :integer, default: 0
    field :denominator, :integer, default: 4
    field :total_count, :integer, default: 0
  end
end
