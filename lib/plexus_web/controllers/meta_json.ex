defmodule PlexusWeb.MetaJSON do
  @doc """
  Builds meta map for JSON API.
  """
  def meta(meta \\ %{}, data)

  def meta(meta, %Scrivener.Page{} = page) do
    Map.merge(meta, %{
      page_number: page.page_number,
      limit: page.page_size,
      total_count: page.total_entries,
      total_pages: page.total_pages
    })
  end
end
