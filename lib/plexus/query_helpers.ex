defmodule Plexus.QueryHelpers do
  @moduledoc """
  Helpers for Ecto Queries.
  """
  import Ecto.Query

  @doc """
  Merge options into the given query.

  All options delegate to their Ecto.Query internal function.
  To be used with Repo functions.

  ## Options

    * `:order_by` https://hexdocs.pm/ecto/Ecto.Query.html#order_by/3
    * `:preload` https://hexdocs.pm/ecto/Ecto.Query.html#preload/3

  """
  def merge_opts(query, opts) do
    Enum.reduce(opts, query, fn
      {:order_by, sort_order}, query ->
        from q in query, order_by: ^sort_order

      {:preload, associations}, query ->
        from q in query, preload: ^associations

      {:rating_type, rating_type}, query ->
        from q in query, where: q.rating_type == ^rating_type

      _, query ->
        query
    end)
  end
end
