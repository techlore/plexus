defmodule Plexus.Repo.Migrations.CreateRatings do
  use Ecto.Migration

  def change do
    create table(:ratings, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :app_version, :string, null: false
      add :app_build_number, :integer, null: false
      add :google_lib, :string, null: false
      add :score, :integer, null: false
      add :notes, :text

      add :app_package,
          references(:apps, column: :package, type: :citext, on_delete: :delete_all),
          null: false

      timestamps()
    end

    create index(:ratings, [:app_package])
    create index(:ratings, [:app_package, :app_version])
    create index(:ratings, [:app_package, :app_build_number])
  end
end
