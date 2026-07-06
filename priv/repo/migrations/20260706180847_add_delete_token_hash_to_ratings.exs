defmodule Plexus.Repo.Migrations.AddDeleteTokenHashToRatings do
  use Ecto.Migration

  def change do
    alter table(:ratings) do
      add :delete_token_hash, :binary
    end
  end
end
