defmodule Plexus.Repo.Migrations.CreateApps do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION IF NOT EXISTS citext", ""
    execute "CREATE EXTENSION IF NOT EXISTS pg_trgm", ""
    execute "CREATE EXTENSION IF NOT EXISTS fuzzystrmatch", ""

    create table(:apps, primary_key: false) do
      add :package, :citext, primary_key: true
      add :name, :citext, null: false

      timestamps()
    end

    create unique_index(:apps, [:name])
  end
end
