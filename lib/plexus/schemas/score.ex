defmodule Plexus.Schemas.Score do
  use Plexus.Schema

  @primary_key false
  embedded_schema do
    field :app_package, :string
    field :rating_type, Ecto.Enum, values: [:native, :micro_g]
    field :numerator, :integer, default: 0
    field :denominator, :integer, default: 4
    field :total_count, :integer, default: 0
  end

  def level(%Score{numerator: numerator}) do
    case do
      numerator < 1 -> :unrated
      numerator < 2 -> :borked
      numerator < 3 -> :bronze
      numerator < 3.5 -> :silver
      true -> :gold
    end
  end
end
