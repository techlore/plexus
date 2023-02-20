defmodule Plexus.Repo.Migrations.CreateRatingsTable do
  use Ecto.Migration

  def change do
    create table(:ratings) do
      add :application_id, references(:applications, type: :binary_id, on_delete: :delete_all),
        null: false

      add :application_version, :string, null: false
      add :application_build_number, :integer, null: false
      add :status, :string, null: false
      add :google_lib, :string, null: false
      add :score, :integer, null: false
      add :notes, :text
      timestamps()
    end

    create index(:ratings, [:application_id])
    create index(:ratings, [:google_lib])
    create index(:ratings, [:status])
  end
end