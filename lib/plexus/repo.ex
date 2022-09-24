defmodule Plexus.Repo do
  use Ecto.Repo, otp_app: :plexus, adapter: Ecto.Adapters.Postgres
  use Scrivener, page_size: 15

  @typedoc """
  What is returned from a `Retail.Repo.paginate/2` call.

  A Page has 5 fields that can be accessed:

    * entries
    * page_number
    * page_size
    * total_entries
    * total_pages

  """
  @type page(entry) :: Scrivener.Page.t(entry)
end
