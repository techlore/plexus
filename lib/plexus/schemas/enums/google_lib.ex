defmodule Plexus.Schemas.Enums.GoogleLib do
  @google_libs [:none, :micro_g]

  @spec values :: [atom()]
  def values, do: @google_libs
end
