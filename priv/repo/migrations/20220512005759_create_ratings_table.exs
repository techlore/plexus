defmodule Plexus.Repo.Migrations.CreateRatingsTable do
  use Ecto.Migration

  def change do
    create table(:ratings) do
      add :application_package,
          references(:applications, column: :package, type: :string, on_delete: :delete_all),
          null: false

      add :application_version, :string, null: false
      add :application_build_number, :integer, null: false
      add :google_lib, :string, null: false
      add :score, :integer, null: false
      add :notes, :text
      timestamps()
    end

    create index(:ratings, [:application_package])
    create index(:ratings, [:google_lib])
  end
end
