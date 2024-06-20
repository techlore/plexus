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
    case floor(numerator) do
      0 -> :unrated
      1 -> :borked
      2 -> :bronze
      3 -> :silver
      4 -> :gold
    end
  end
end
