defmodule Plexus.Repo.Migrations.MakeRatingAppVersionNullable do
  use Ecto.Migration

  def change do
    alter table(:ratings) do
      modify :app_version, :string, null: true, from: {:string, null: true}
    end
  end
end
