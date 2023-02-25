defmodule Plexus.Repo do
  use Ecto.Repo, otp_app: :plexus, adapter: Ecto.Adapters.Postgres
  use Scrivener, page_size: 15
end
