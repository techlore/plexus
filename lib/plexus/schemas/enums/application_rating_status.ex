defmodule Plexus.Schemas.Enums.ApplicationRatingStatus do
  @google_libs [:needs_review, :approved, :rejected]

  @spec values :: [atom()]
  def values, do: @google_libs
end
