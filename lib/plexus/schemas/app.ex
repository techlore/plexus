defmodule Plexus.Schemas.App do
  @moduledoc """
  A software application running on the Android platform. Because the Android
  platform is built for mobile devices, a typical Android app is designed for a
  smartphone or a tablet PC running on the Android OS.
  """
  use Plexus.Schema

  @primary_key false
  @derive {Phoenix.Param, key: :package}
  schema "apps" do
    field :package, :string, primary_key: true
    field :name, :string

    timestamps()
  end
end
