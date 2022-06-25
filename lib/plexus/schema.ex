defmodule Plexus.Schema do
  defmacro __using__(_) do
    quote do
      use Ecto.Schema

      alias __MODULE__
      alias Plexus.Schemas
      alias Plexus.Schemas.Enums

      import Ecto.Changeset
      import Ecto.Query

      @type t :: %__MODULE__{}

      @primary_key {:id, :binary_id, autogenerate: true}
      @foreign_key_type :binary_id
      @timestamps_opts [type: :utc_datetime_usec]

      @spec new!(Enumerable.t()) :: t()
      def new!(attrs \\ []) do
        struct!(__MODULE__, attrs)
      end

      @spec new(Enumerable.t()) :: t()
      def new(attrs \\ []) do
        struct(__MODULE__, attrs)
      end
    end
  end
end
