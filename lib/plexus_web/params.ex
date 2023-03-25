defmodule PlexusWeb.Params do
  @moduledoc """
  Utilities that help handle external params.
  """

  @type field :: atom()
  @type type :: atom() | tuple()
  @type opts :: Keyword.t()

  @type schema :: %{field() => {type(), opts()}}

  @type t :: %__MODULE__{
          types: map(),
          defaults: map(),
          permitted: [atom()],
          required: [atom()]
        }

  defstruct defaults: %{}, types: %{}, permitted: [], required: []

  @doc """
  Normalize external input params.

  ## Options

    - required (boolean)
    - default (any)

  ## Examples

      iex> PlexusWeb.Params.normalize(%{"name" => "Spock"}, %{
      ...>   name: {:string, required: true},
      ...>   affiliation: {:string, default: "Starfleet"},
      ...>   date_of_birth: {:utc_datetime_usec, []}
      ...> })
      {:ok, %{name: "Spock", affiliation: "Starfleet"}}

  """
  @spec normalize(map(), schema()) :: {:ok, map()} | {:error, Ecto.Changeset.t()}
  def normalize(unsigned_params, schema) do
    %{
      defaults: data,
      types: types,
      permitted: permitted,
      required: required
    } = prepare(schema)

    {data, types}
    |> Ecto.Changeset.cast(unsigned_params, permitted)
    |> Ecto.Changeset.validate_required(required)
    |> Ecto.Changeset.apply_action(:normalize)
  end

  defp prepare(schema) do
    Enum.reduce(schema, %__MODULE__{}, fn {field, {type, opts}}, acc ->
      acc
      |> put_default(field, opts)
      |> put_type(field, type)
      |> put_permitted(field)
      |> put_required(field, opts)
    end)
  end

  defp put_default(acc, field, opts) do
    if default = opts[:default] do
      Map.update!(acc, :defaults, &Map.put(&1, field, default))
    else
      acc
    end
  end

  defp put_type(acc, field, type) do
    Map.update!(acc, :types, &Map.put(&1, field, type))
  end

  defp put_permitted(acc, field) do
    Map.update!(acc, :permitted, &[field | &1])
  end

  defp put_required(acc, field, opts) do
    if opts[:required] do
      Map.update!(acc, :required, &[field | &1])
    else
      acc
    end
  end
end
