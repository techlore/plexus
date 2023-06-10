defmodule Plexus.Schema do
  @moduledoc """
  Provides baseline functionality for modules which define schemas mapping to
  database tables.
  """

  defmacro __using__(_) do
    quote do
      use Ecto.Schema

      alias __MODULE__

      import Ecto.Changeset

      @type t :: %__MODULE__{}

      @primary_key {:id, :binary_id, autogenerate: true}
      @foreign_key_type :binary_id
      @timestamps_opts [type: :utc_datetime_usec]
    end
  end
end
