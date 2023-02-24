defmodule Plexus.Repo.Migrations.CreateApplicationsTable do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION IF NOT EXISTS citext", ""

    create table(:applications, primary_key: false) do
      add :package, :citext, primary_key: true
      add :name, :citext, null: false
      timestamps()
    end

    create unique_index(:applications, [:name])
  end
end
