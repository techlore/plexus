defmodule Plexus.Repo.Migrations.CreateRatings do
  use Ecto.Migration

  def change do
    create table(:ratings, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :android_version, :string, null: false
      add :app_version, :string, null: false
      add :app_build_number, :integer
      add :rom_name, :string
      add :rom_build, :string
      add :rating_type, :string, null: false
      add :score, :integer, null: false
      add :installation_source, :text
      add :notes, :text

      add :app_package,
          references(:apps, column: :package, type: :citext, on_delete: :delete_all),
          null: false

      timestamps()
    end

    create index(:ratings, [:app_package])
    create index(:ratings, [:rating_type])
    create index(:ratings, [:app_package, :rating_type])
  end
end
