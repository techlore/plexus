defmodule Plexus.Repo do
  use Ecto.Repo,
    otp_app: :plexus,
    adapter: Ecto.Adapters.Postgres
end
