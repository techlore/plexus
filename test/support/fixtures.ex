defmodule Plexus.Fixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Plexus` context.
  """

  alias Plexus.Schemas.Enums

  def application_fixture(attrs \\ %{}) do
    attrs
    |> Enum.into(%{
      name: "application#{System.unique_integer()}",
      package: "tech.techlore.plexus"
    })
    |> Plexus.Applications.create!()
  end
end
