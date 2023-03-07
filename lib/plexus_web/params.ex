defmodule PlexusWeb.Params do
  @moduledoc """
  Utilities that help handle external params.
  """

  @type field :: atom()
  @type type :: atom()
  @type opts :: Keyword.t()

  @type schema :: %{field() => {type(), opts()}}

  @doc """
  Normalize external input params.

  ## Supported Options

    - required (boolean)

  ## Examples

      iex> PlexusWeb.Params.normalize(%{"name" => "Spock"}, %{
      ...>   name: {:string, required: true},
      ...>   date_of_birth: {:utc_datetime_usec, []}
      ...> })
      {:ok, %{name: "Spock"}}

  """
  @spec normalize(map(), schema()) :: {:ok, map()} | {:error, Ecto.Changeset.t()}
  def normalize(params, schema) do
    %{types: types, permitted: permitted, required: required} =
      Enum.reduce(schema, %{types: %{}, permitted: [], required: []}, fn
        {field, {type, opts}}, acc ->
          acc
          |> put_type(field, type)
          |> put_permitted(field)
          |> put_required(field, opts)
      end)

    {%{}, types}
    |> Ecto.Changeset.cast(params, permitted)
    |> Ecto.Changeset.validate_required(required)
    |> Ecto.Changeset.apply_action(:normalize)
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
