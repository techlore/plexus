defmodule Plexus.Repo.Migrations.CreateApplicationRatingsTable do
  use Ecto.Migration

  def change do
    create table(:application_ratings) do
      add :application_id, references(:applications, type: :binary_id, on_delete: :delete_all),
        null: false

      add :application_version, :string, null: false
      add :application_build_number, :integer, null: false
      add :status, :string, null: false
      add :google_lib, :string, null: false
      add :rating, :integer, null: false
      add :notes, :text
      timestamps()
    end

    create index(:application_ratings, [:application_id])
    create index(:application_ratings, [:google_lib])
    create index(:application_ratings, [:status])
  end
end
