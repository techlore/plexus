defmodule Plexus.Repo.Migrations.AddApplicationsTable do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION IF NOT EXISTS citext", ""

    create table(:applications, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :citext, null: false
      add :package, :string

      timestamps()
    end

    create unique_index(:applications, [:name])
  end
end
