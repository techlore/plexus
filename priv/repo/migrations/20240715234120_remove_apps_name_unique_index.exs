defmodule Plexus.Repo.Migrations.RemoveAppsNameUniqueIndex do
  use Ecto.Migration

  def change do
    drop_if_exists index(:apps, [:name])
  end
end
