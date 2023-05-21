defmodule Plexus.PaginationHelpers do
  @moduledoc """
  Helpers for Repo Pagination.
  """

  @doc """
  Generate pagination options.
  To be used with functions that call `Repo.paginate/2`.

  ## Optional

    * `page_size` or `limit` - the amount of entries ger page
    * `page` or `page_number` - the page to return

  ## Examples

      iex> Plexus.PaginationHelpers.page_opts(%{
      ...>   page_size: 30,
      ...>   page: 9
      ...> })
      [page_size: 30, page: 9]

      iex> Plexus.PaginationHelpers.page_opts(%{
      ...>   limit: 30
      ...> })
      [page_size: 30]

      iex> Plexus.PaginationHelpers.page_opts(%{
      ...>   page: 3
      ...> })
      [page: 3]

      iex> Plexus.PaginationHelpers.page_opts(%{})
      []

      iex> Plexus.PaginationHelpers.page_opts(%{bogus: :value})
      []

  """
  @spec page_opts(Enumerable.t()) :: keyword()
  def page_opts(opts) do
    Enum.reduce(opts, [], fn
      {:limit, limit}, opts when is_integer(limit) ->
        [{:page_size, limit} | opts]

      {:page_size, page_size}, opts when is_integer(page_size) ->
        [{:page_size, page_size} | opts]

      {:page, page}, opts when is_integer(page) ->
        [{:page, page} | opts]

      _, opts ->
        opts
    end)
  end
end
