defmodule Plexus.Repo.Migrations.CreateApplicationsTable do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION IF NOT EXISTS citext", ""

    create table(:applications) do
      add :name, :citext, null: false
      add :package, :string
      timestamps()
    end

    create unique_index(:applications, [:name])
  end
end
